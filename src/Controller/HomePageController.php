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
     * @Route("/login", name="login")
     */
    public function login(): Response
    {
        return $this->render('security/login.html.twig');
    }

     /**
     * @Route("/register", name="register")
     */
    public function register(): Response
    {
        return $this->render('registration/register.html.twig');
    }

}
