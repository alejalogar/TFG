<?php

namespace App\Controller;

use App\Entity\Crucero;
use App\Entity\TipoCrucero;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\CruceroRepository;
use App\Repository\TipoCruceroRepository;


class HomePageController extends AbstractController
{
/**
 * @Route("/", name="inicio")
 */
public function index(Request $request, CruceroRepository $cruceroRepository, TipoCruceroRepository $tipoCruceroRepository): Response
{
    $destinos = $cruceroRepository->findAllDestinos();
    $tipos = $tipoCruceroRepository->findAll();

    if ($request->query->has('destino') && $request->query->has('experiencia') && $request->query->has('fecha')) {
        $destino = $request->query->get('destino');
        $experiencia = $request->query->get('experiencia');
        $fecha = $request->query->get('fecha');

        $cruceros = $cruceroRepository->buscarCruceros($destino, $experiencia, $fecha);

        // Verificar si se encontraron cruceros
        if (!empty($cruceros)) {
            return $this->render('cruceros/resultado_busqueda.html.twig', [
                'destino' => $destino,
                'experiencia' => $experiencia,
                'fecha' => $fecha,
                'cruceros' => $cruceros,
                'tipos' => $tipos,
            ]);
        } else {
            // No se encontraron cruceros
            return $this->render('cruceros/no_results.html.twig', [
                'destino' => $destino,
                'experiencia' => $experiencia,
                'fecha' => $fecha,
            ]);
        }
    }

    return $this->render('inicio/inicio.html.twig', [
        'destinos' => $destinos,
        'tipos' => $tipos,
    ]);
}




    /**
     * @Route("/reserva", name="reserva")
     */
    public function reserva(): Response
    {
        return $this->render('secciones/reservaya.html.twig');
    }

    /**
     * @Route("/about", name="about")
     */
    public function about(): Response
    {
        return $this->render('secciones/about.html.twig');
    }

    /**
     * @Route("/contact", name="contact")
     */
    public function contact(): Response
    {
        return $this->render('secciones/contact.html.twig');
    }


}
