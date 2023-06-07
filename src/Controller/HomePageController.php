<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomePageController extends AbstractController
{

    /**
     * @Route("/", name="inicio")
     */
    public function index(): Response
    {
        return $this->render('inicio/inicio.html.twig');
    }

    /**
     * @Route("/cruceros", name="cruceros")
     */
    public function cruceros(): Response
    {
        return $this->render('secciones/cruceros.html.twig');
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
