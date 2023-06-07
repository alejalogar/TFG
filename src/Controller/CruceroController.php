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

class CruceroController extends AbstractController
{

    /**
     * @Route("/cruceros", name="cruceros_list")
     */
    public function findAllCruceros(): Response
    {
        $cruceros = $this->getDoctrine()->getRepository(Crucero::class)->findAll();
        $tipos = $this->getDoctrine()->getRepository(Tipocrucero::class)->findAll();
        return $this->render('cruceros/list.html.twig', [
            'cruceros' => $cruceros,
            'tipos' => $tipos,
        ]);
    }
    

    /**
     * @Route("/cruceros/{tipoId}", name="cruceros_tipo")
     */
    public function listCrucerosByTipo(CruceroRepository $cruceroRepository, $tipoId): Response
    {
        $cruceros = $cruceroRepository->findCrucerosByTipo($tipoId);

        // Hacer algo con los cruceros, por ejemplo, pasarlos a una plantilla para renderizarlos

        return $this->render('cruceros/list.html.twig', [
            'cruceros' => $cruceros,
        ]);
    }
}
