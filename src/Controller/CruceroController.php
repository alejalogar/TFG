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

use Dompdf\Dompdf;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;



class CruceroController extends AbstractController
{

/**
 * @Route("/cruceros", name="cruceros_list")
 */
public function findAllCruceros(Request $request): Response
{
    $destino = $request->query->get('destino');
    $experiencia = $request->query->get('experiencia');

    $cruceroRepository = $this->getDoctrine()->getRepository(Crucero::class);

    

    if ($destino && $experiencia) {
        $cruceros = $cruceroRepository->findCrucerosByDestinoAndExperiencia($destino, $experiencia);
    } elseif ($destino) {
        $cruceros = $cruceroRepository->findCrucerosByDestino($destino);
    } elseif ($experiencia) {
        $cruceros = $cruceroRepository->findCrucerosByExperiencia($experiencia);
    } else {
        $cruceros = $cruceroRepository->findAll();
    }

    $tipos = $this->getDoctrine()->getRepository(TipoCrucero::class)->findAll();

    return $this->render('cruceros/list.html.twig', [
        'cruceros' => $cruceros,
        'tipos' => $tipos,
        'destinos' => $destinos, // Pasar la variable 'destinos' a la plantilla Twig
        'experiencias' => $experiencias, // Pasar la variable 'experiencias' a la plantilla Twig
    ]);
}


    /**
     * @Route("/cruceros/tipo/{tipoId}", name="cruceros_por_tipo")
     */
    public function crucerosPorTipo($tipoId, TipoCruceroRepository $tipoCruceroRepository, CruceroRepository $cruceroRepository): Response
    {
        $tipoCrucero = $tipoCruceroRepository->find($tipoId);
        $tipos = $this->getDoctrine()->getRepository(Tipocrucero::class)->findAll();


        if (!$tipoCrucero) {
            throw $this->createNotFoundException('El tipo de crucero no existe.');
        }

        $cruceros = $cruceroRepository->findCrucerosByTipo($tipoId);

        return $this->render('cruceros/cruceros_por_tipo.html.twig', [
            'tipoCrucero' => $tipoCrucero,
            'cruceros' => $cruceros,
            'tipos' => $tipos,
        ]);
    }

    /**
     * @Route("/cruceros/destino/{destino}", name="cruceros_por_destino")
     */
    public function crucerosPorDestino($destino, CruceroRepository $cruceroRepository): Response
    {
        $cruceros = $cruceroRepository->findCrucerosByDestino($destino);
        $tipos = $this->getDoctrine()->getRepository(Tipocrucero::class)->findAll();

        return $this->render('cruceros/cruceros_por_destino.html.twig', [
            'destino' => $destino,
            'cruceros' => $cruceros,
            'tipos' => $tipos,
        ]);
    }
/**
 * @Route("/reservar/{cruceroId}", name="reservar_crucero")
 */
public function reservarCrucero($cruceroId, Request $request, CruceroRepository $cruceroRepository, ServiciosCruceroRepository $serviciosCruceroRepository, ServicioRepository $serviciosRepository, CamaroteRepository $camarotesRepository, UserRepository $userRepository, MailerInterface $mailer): Response
{
    $crucero = $cruceroRepository->find($cruceroId);
    $tipos = $this->getDoctrine()->getRepository(Tipocrucero::class)->findAll();
    $entityManager = $this->getDoctrine()->getManager();

    // Obtener los servicio_id de la tabla ServiciosCrucero que coincidan con crucero_id
    $servicioIds = $serviciosCruceroRepository->findByCruceroId($cruceroId);

$servicios = [];
foreach ($servicioIds as $servicioCrucero) {
    // Obtener el servicio relacionado a través de la propiedad "servicio" en ServiciosCrucero
    $servicio = $servicioCrucero->getServicio();

    if ($servicio) {
        $servicios[] = $servicio;
    }
}
    $camarotes = $camarotesRepository->findCamarotesDisponiblesByCruceroId($cruceroId);
    
    $user = $this->getUser(); // Obtener el usuario actualmente autenticado
    
    if ($request->isMethod('POST')) {
        $camaroteId = $request->request->get('camarote');
        $servicioId = $request->request->get('servicio');
        
        // Crear una nueva reserva
        $reserva = new Reserva();
        $reserva->setUsuario($user);
        $reserva->setCamarote($camarotesRepository->find($camaroteId));
        $reserva->setFechaDeReserva(new \DateTime());
        
        // Crear un nuevo registro en la tabla "abordo"
        $abordo = new Abordo();
        $abordo->setCamarote($camarotesRepository->find($camaroteId));
        $abordo->setServicio($serviciosRepository->find($servicioId));
        $abordo->setFechaDeSolicitud(new \DateTime());
        
        $entityManager->persist($reserva);
        $entityManager->persist($abordo);
        $entityManager->flush();
        
        // Generar el contenido del PDF
        $pdfContent = $this->generatePdfContent($crucero, $tipos, $servicios, $camarotes);

        // Enviar el PDF por correo electrónico
        $usuario = $user->getUsername();
        $message = (new Email())
            ->from('bhcruceros@gmail.com')
            ->to($usuario)
            ->subject('Confirmación de Reserva')
            ->text('¡Tu reserva se ha realizado con éxito! Adjunto encontrarás los detalles de tu reserva.')
            ->attach($pdfContent, 'reserva.pdf', 'application/pdf');

        $mailer->send($message);

        // Redirigir a una página de confirmación o mostrar un mensaje de éxito
        return $this->render('cruceros/confirmacion_reserva.html.twig', [
            'crucero' => $crucero,
            'tipos' => $tipos,
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

    $html = $this->render('pdf/pdf.html.twig', [
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
