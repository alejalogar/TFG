<?php

namespace App\Repository;

use App\Entity\Crucero;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\QueryBuilder;
use App\Entity\TipoCrucero;


/**
 * @extends ServiceEntityRepository<Crucero>
 *
 * @method Crucero|null find($id, $lockMode = null, $lockVersion = null)
 * @method Crucero|null findOneBy(array $criteria, array $orderBy = null)
 * @method Crucero[]    findAll()
 * @method Crucero[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CruceroRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Crucero::class);
    }

    public function add(Crucero $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Crucero $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findAllCruceros()
    {
        return $this->createQueryBuilder('c')
            ->getQuery()
            ->getResult();
    }
    public function findCrucerosByTipo($tipoId)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.tipo = :tipoId')
            ->setParameter('tipoId', $tipoId)
            ->getQuery()
            ->getResult();
    }

    public function findCrucerosByExperiencia($experiencia){
        $entityManager = $this->getEntityManager();
        $tipoCrucero = $entityManager->getRepository(TipoCrucero::class)->findOneBy(['nombre' => $experiencia]);
        $tipoCruceroId = $tipoCrucero->getId();
        return $this->createQueryBuilder('c')
            ->andWhere('c.tipo = :tipoId')
            ->setParameter('tipoId', $tipoCruceroId)
            ->getQuery()
            ->getResult();
    }

    public function findCrucerosByDestinoAndExperiencia($destino, $experiencia){
        $entityManager = $this->getEntityManager();
        $tipoCrucero = $entityManager->getRepository(TipoCrucero::class)->findOneBy(['nombre' => $experiencia]);
        $tipoCruceroId = $tipoCrucero->getId();
        return $this->createQueryBuilder('c')
    ->andWhere('c.destinoId = :destino')
    ->andWhere('c.tipoCrucero = :tipo')
    ->setParameter('destino', $destino)
    ->setParameter('tipo', $tipoCrucero)
    ->getQuery()
    ->getResult();

    }

    

    public function buscarCruceros($destino, $experiencia)
{
    $entityManager = $this->getEntityManager();

    $queryBuilder = $this->createQueryBuilder('c')
        ->join('c.tipo', 't');

    if ($destino) {
        $queryBuilder->andWhere('c.destino = :destino')
            ->setParameter('destino', $destino);
    }

    if ($experiencia) {
        $tipoCrucero = $entityManager->getRepository(TipoCrucero::class)->findOneBy(['nombre' => $experiencia]);
        $tipoCruceroId = $tipoCrucero->getId();

        $queryBuilder->andWhere('t.id = :experienciaId')
            ->setParameter('experienciaId', $tipoCruceroId);
    }

    return $queryBuilder->getQuery()->getResult();
}

    
    public function findCrucerosByDestino($destino)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.destino = :destino')
            ->setParameter('destino', $destino)
            ->getQuery()
            ->getResult();
    }



    public function findAllDestinos(): array
    {
        $qb = $this->createQueryBuilder('c');
        $qb->select('c.destino')->distinct(true);
    
        $query = $qb->getQuery();
        $result = $query->getResult();
    
        $destinos = array_column($result, 'destino');
    
        return $destinos;
    }





    



//    /**
//     * @return Crucero[] Returns an array of Crucero objects
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

//    public function findOneBySomeField($value): ?Crucero
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
