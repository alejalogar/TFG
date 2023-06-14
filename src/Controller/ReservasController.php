<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Reserva;
use App\Repository\ReservaRepository;


class ReservasController extends AbstractController
{
    private $reservaRepository;
    private $tipoCruceroRepository;
    private $serviciosCruceroRepository;
    private $servicioRepository;
    private $camaroteRepository;
    private $userRepository;
    private $mailer;

    public function __construct(
        ReservaRepository $reservaRepository
    ) {
        $this->reservaRepository = $reservaRepository;
    }
    /**
    * @Route("/reservas", name="reservas_index", methods={"GET"})
    */
    public function index(): Response
    {
        // Obtiene el usuario actualmente autenticado
        $usuario = $this->getUser();

        // Obtiene todas las reservas del usuario actual
        $reservas = $this->reservaRepository->findBy(['usuario' => $usuario]);

        // Renderiza la plantilla 'reservas/usuario.html.twig' y pasa las reservas como variable
        return $this->render('reservas/reservas.html.twig', [
            'reservas' => $reservas,
        ]);
    }
}
