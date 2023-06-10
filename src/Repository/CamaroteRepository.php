<?php

namespace App\Repository;

use App\Entity\Camarote;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Camarote>
 *
 * @method Camarote|null find($id, $lockMode = null, $lockVersion = null)
 * @method Camarote|null findOneBy(array $criteria, array $orderBy = null)
 * @method Camarote[]    findAll()
 * @method Camarote[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CamaroteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Camarote::class);
    }

    public function add(Camarote $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Camarote $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findCamarotesDisponiblesByCruceroId($cruceroId)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.crucero = :cruceroId')
            ->andWhere('c.cantidadDisponible > 0')
            ->setParameter('cruceroId', $cruceroId)
            ->getQuery()
            ->getResult();
    }

//    /**
//     * @return Camarote[] Returns an array of Camarote objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Camarote
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
