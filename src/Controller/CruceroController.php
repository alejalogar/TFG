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


}
