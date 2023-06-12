<?php

// src/Repository/AbordoRepository.php
namespace App\Repository;

use App\Entity\Abordo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class AbordoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Abordo::class);
    }
}
