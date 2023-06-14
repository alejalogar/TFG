<?php

namespace App\Controller;

use App\Entity\Crucero;
use App\Entity\TipoCrucero;
use App\Entity\Reserva;
use App\Entity\User;
use App\Entity\Abordo;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

use App\Repository\CruceroRepository;
use App\Repository\TipoCruceroRepository;
use App\Repository\ServiciosCruceroRepository;
use App\Repository\ServicioRepository;
use App\Repository\CamaroteRepository;
use App\Repository\ReservaRepository;
use App\Repository\UserRepository;
use App\From\Type\TaskType;

use Dompdf\Dompdf;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

    /**
     * @Route("/private", name="private")
     */


class CruceroController extends AbstractController
{
    private $cruceroRepository;
    private $tipoCruceroRepository;
    private $serviciosCruceroRepository;
    private $servicioRepository;
    private $camaroteRepository;
    private $userRepository;
    private $mailer;

    public function __construct(
        CruceroRepository $cruceroRepository,
        TipoCruceroRepository $tipoCruceroRepository,
        ServiciosCruceroRepository $serviciosCruceroRepository,
        ServicioRepository $servicioRepository,
        CamaroteRepository $camaroteRepository,
        UserRepository $userRepository,
        MailerInterface $mailer
    ) {
        $this->cruceroRepository = $cruceroRepository;
        $this->tipoCruceroRepository = $tipoCruceroRepository;
        $this->serviciosCruceroRepository = $serviciosCruceroRepository;
        $this->servicioRepository = $servicioRepository;
        $this->camaroteRepository = $camaroteRepository;
        $this->userRepository = $userRepository;
        $this->mailer = $mailer;
    }

    /**
     * @Route("/cruceros", name="cruceros_list")
     */
    public function findAllCruceros(Request $request): Response
    {
        $destino = $request->query->get('destino');
        $experiencia = $request->query->get('experiencia');
        
        if ($destino && $experiencia) {
            $cruceros = $this->cruceroRepository->findCrucerosByDestinoAndExperiencia($destino, $experiencia);
        } elseif ($destino) {
            $cruceros = $this->cruceroRepository->findCrucerosByDestino($destino);
        } elseif ($experiencia) {
            $cruceros = $this->cruceroRepository->findCrucerosByExperiencia($experiencia);
        } else {
            $cruceros = $this->cruceroRepository->findAll();
        }
        
        $tipos = $this->tipoCruceroRepository->findAll();
        $destinos = $this->cruceroRepository->findAllDestinos(); // Reemplaza 'destinos' por el método correcto de obtener los destinos
        $experiencias = $this->tipoCruceroRepository->findAll(); // Reemplaza 'experiencias' por el método correcto de obtener las experiencias

        return $this->render('cruceros/list.html.twig', [
            'cruceros' => $cruceros,
            'tipos' => $tipos,
            'destinos' => $destinos,
            'experiencias' => $experiencias,
        ]);
    }

    
    /**
     * @Route("/cruceros/tipo/{tipoId}", name="cruceros_por_tipo")
     */
    public function crucerosPorTipo($tipoId): Response
    {
        $tipoCrucero = $this->tipoCruceroRepository->find($tipoId);
        $tipos = $this->tipoCruceroRepository->findAll();

        if (!$tipoCrucero) {
            throw $this->createNotFoundException('El tipo de crucero no existe.');
        }

        $cruceros = $this->cruceroRepository->findCrucerosByTipo($tipoId);

        return $this->render('cruceros/cruceros_por_tipo.html.twig', [
            'tipoCrucero' => $tipoCrucero,
            'cruceros' => $cruceros,
            'tipos' => $tipos,
        ]);
    }

    /**
     * @Route("/cruceros/destino/{destino}", name="cruceros_por_destino")
     */
    public function crucerosPorDestino($destino): Response
    {
        $cruceros = $this->cruceroRepository->findCrucerosByDestino($destino);
        $tipos = $this->tipoCruceroRepository->findAll();

        return $this->render('cruceros/cruceros_por_destino.html.twig', [
            'destino' => $destino,
            'cruceros' => $cruceros,
            'tipos' => $tipos,
        ]);
    }

    /**
     * @Route("/reservar/{cruceroId}", name="reservar_crucero")
     */
    public function reservarCrucero($cruceroId, Request $request, MailerInterface $mailer): Response
    {
        $crucero = $this->cruceroRepository->find($cruceroId);
        $tipos = $this->tipoCruceroRepository->findAll();
        $entityManager = $this->getDoctrine()->getManager();

        // Obtener los servicio_id de la tabla ServiciosCrucero que coincidan con crucero_id
        $servicioIds = $this->serviciosCruceroRepository->findByCruceroId($cruceroId);

        $servicios = [];
        foreach ($servicioIds as $servicioCrucero) {
            // Obtener el servicio relacionado a través de la propiedad "servicio" en ServiciosCrucero
            $servicio = $servicioCrucero->getServicio();

            if ($servicio) {
                $servicios[] = $servicio;
            }
        }
        $camarotes = $this->camaroteRepository->findCamarotesDisponiblesByCruceroId($cruceroId);

        $user = $this->getUser(); // Obtener el usuario actualmente autenticado

        if ($request->isMethod('POST')) {
            $camaroteId = $request->request->get('camarote');
            $servicioId = $request->request->get('servicio');

            // Crear una nueva reserva
            $reserva = new Reserva();
            $reserva->setUsuario($user);
            $reserva->setCamarote($this->camaroteRepository->find($camaroteId));
            $reserva->setFechaDeReserva(new \DateTime());

            // Crear un nuevo registro en la tabla "abordo"
            $abordo = new Abordo();
            $abordo->setCamarote($this->camaroteRepository->find($camaroteId));
            $abordo->setServicio($this->servicioRepository->find($servicioId));
            $abordo->setFechaDeSolicitud(new \DateTime());

            $entityManager->persist($reserva);
            $entityManager->persist($abordo);
            $entityManager->flush();

            $precioCamarote = $this->camaroteRepository->find($camaroteId)->getPrecio(); 
            
            $precioServicio = $this->servicioRepository->find($servicioId)->getPrecio();

            $camarote = $this->camaroteRepository->find($camaroteId);
            
            $servici = $this->servicioRepository->find($servicioId);

            $suma = $precioCamarote + $precioServicio;

            // Generar el PDF
            // $html = $this->renderView('cruceros/confirmacion_reserva.html.twig', [
            //     'crucero' => $crucero,
            //     'tipos' => $tipos,
            //     'camarote' => $camarote,
            //     'servici' => $servici,
            //     'suma' => $suma,
            // ]);
            // $dompdf = new Dompdf();
            // $dompdf->loadHtml($html);
            // $dompdf->setPaper('A4', 'portrait');
            // $dompdf->render();
            // $pdfContent = $dompdf->output();

            // // Enviar el PDF por correo electrónico
            // $usuario = $this->getUser()->getUsername();
            // $email = (new Email())
            //     ->from('tu@correo.com')
            //     ->to($usuario)
            //     ->subject('Confirmación de reserva')
            //     ->text('Adjunto encontrarás la confirmación de tu reserva en formato PDF.')
            //     ->attach($pdfContent, 'confirmacion_reserva.pdf', 'application/pdf');

            // $mailer->send($email);

            return $this->render('cruceros/confirmacion_reserva.html.twig', [
                'crucero' => $crucero,
                'tipos' => $tipos,
                'camarote' => $camarote,
                'servici' => $servici,
                'suma' => $suma,
            ]);
        }
        return $this->render('cruceros/reservar_crucero.html.twig', [
            'crucero' => $crucero,
            'tipos' => $tipos,
            'servicios' => $servicios,
            'camarotes' => $camarotes,
        ]);
    }

    private function generatePdfContent($crucero, $tipos, $servicios, $camarotes)
    {
        // Generar el contenido del PDF utilizando una librería como Dompdf
        $html = $this->renderView('pdf/pdf.html.twig', [
            'crucero' => $crucero,
            'tipos' => $tipos,
            'servicios' => $servicios,
            'camarotes' => $camarotes,
        ]);

        $dompdf = new Dompdf();
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();

        return $dompdf->output();
    }
}
