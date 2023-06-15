<?php

namespace App\Repository;

use App\Entity\Reserva;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Reserva>
 *
 * @method Reserva|null find($id, $lockMode = null, $lockVersion = null)
 * @method Reserva|null findOneBy(array $criteria, array $orderBy = null)
 * @method Reserva[]    findAll()
 * @method Reserva[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReservaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Reserva::class);
    }

    public function add(Reserva $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Reserva $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function obtenerReservasAgrupadasPorCrucero()
{
    $entityManager = $this->getEntityManager();
    $reservas = $this->findAll();
    $reservasAgrupadas = [];

    foreach ($reservas as $reserva) {
        $crucero = $reserva->getCamarote()->getCrucero();

        $cruceroId = $crucero->getId();
        $cruceroNombre = $crucero->getNombre();
        $cruceroTipo = $crucero->getTipo()->getNombre();
        $cruceroFechaLlegada = $crucero->getFechaDeLlegada()->format('Y-m-d');
        $cruceroFechaSalida = $crucero->getFechaDeSalida()->format('Y-m-d');
        $cruceroReservasTotales = 1;
        $cruceroHuecosRestantes = 35;

        if (isset($reservasAgrupadas[$cruceroId])) {
            $cruceroReservasTotales += $reservasAgrupadas[$cruceroId]['reservas'];
        }

        // Obtener los detalles de las reservas por crucero
        if (!isset($reservasAgrupadas[$cruceroId])) {
            $reservasAgrupadas[$cruceroId] = [
                'nombre' => $cruceroNombre,
                'tipo' => $cruceroTipo,
                'fechaLlegada' => $cruceroFechaLlegada,
                'fechaSalida' => $cruceroFechaSalida,
                'reservas' => $cruceroReservasTotales,
                'huecosRestantes' => $cruceroHuecosRestantes,
                'reservasDetalle' => []
            ];
        }

        // Obtener los detalles de las reservas asociadas al crucero
        $reservasDetalle = $reservasAgrupadas[$cruceroId]['reservasDetalle'];
        $reservasDetalle[] = [
            'usuario' => $reserva->getUsuario(),
            'fecha' => $reserva->getFechaDeReserva()->format('Y-m-d'),
            'camarote' => $reserva->getCamarote(),
        ];

        $reservasAgrupadas[$cruceroId]['reservasDetalle'] = $reservasDetalle;
    }

    return $reservasAgrupadas;
}



    
    
    
    public function obtenerCamarotesReservados()
    {
        $queryBuilder = $this->createQueryBuilder('c')
        ->select('c')
        ->getQuery();

    $camarotes = $queryBuilder->getResult();

    return $camarotes;
    }

    


//    /**
//     * @return Reserva[] Returns an array of Reserva objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('r.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Reserva
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
