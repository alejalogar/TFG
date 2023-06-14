<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Reserva;
use App\Repository\ReservaRepository;

    /**
     * @Route("/admin", name="admin")
     */
class AdminController extends AbstractController
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
     * @Route("/", name="inicio_admin")
     */
    public function index(): Response
    {
        $reservasPorCrucero = $this->reservaRepository->findAllReservasByCrucero();

        // Renderiza una plantilla para mostrar las reservas organizadas por crucero
        return $this->render('admin/reservas_por_crucero.html.twig', [
            'reservasPorCrucero' => $reservasPorCrucero,
        ]);
    }
    /**
     * @Route("/reservas", name="reservas")
     */
    public function reservasPorCrucero(): Response
    {
        $reservasPorCrucero = $this->reservaRepository->findAllReservasByCrucero();

        // Renderiza una plantilla para mostrar las reservas organizadas por crucero
        return $this->render('admin/reservas_por_crucero.html.twig', [
            'reservasPorCrucero' => $reservasPorCrucero,
        ]);
    }
    /**
     * @Route("/cruceros", name="cruceros_admin")
     */
    public function cruceros(): Response
    {
        $reservasPorCrucero = $this->reservaRepository->findAllReservasByCrucero();

        // Renderiza una plantilla para mostrar las reservas organizadas por crucero
        return $this->render('admin/reservas_por_crucero.html.twig', [
            'reservasPorCrucero' => $reservasPorCrucero,
        ]);
    }
}
