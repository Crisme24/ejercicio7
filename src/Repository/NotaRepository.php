<?php

namespace App\Repository;

use App\Entity\Nota;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\Persistence\ManagerRegistry;

class NotaRepository extends ServiceEntityRepository
{
    /**
     * @var Connection
     */
    private $connection;

    public function __construct(ManagerRegistry $registry, Connection $connection)
    {
        parent::__construct($registry, Nota::class);
        $this->connection = $connection;
    }

    public function findByAlumno($alumno_id){
        return $this->getEntityManager()
            ->createQuery('
                SELECT nota.nota, alumno.nombre
                FROM App\Entity\Nota nota
                WHERE nota.alumno =:alumno_id
            ')
            ->setParameter('alumno_id',$alumno_id);
    }
}
