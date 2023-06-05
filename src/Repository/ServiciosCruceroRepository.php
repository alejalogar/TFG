<?php

namespace App\Repository;

use App\Entity\ServiciosCrucero;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ServiciosCrucero>
 *
 * @method ServiciosCrucero|null find($id, $lockMode = null, $lockVersion = null)
 * @method ServiciosCrucero|null findOneBy(array $criteria, array $orderBy = null)
 * @method ServiciosCrucero[]    findAll()
 * @method ServiciosCrucero[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ServiciosCruceroRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ServiciosCrucero::class);
    }

    public function add(ServiciosCrucero $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(ServiciosCrucero $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return ServiciosCrucero[] Returns an array of ServiciosCrucero objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('s.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?ServiciosCrucero
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
