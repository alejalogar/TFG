<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ServiciosCruceroRepository")
 */
class ServiciosCrucero
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Crucero")
     * @ORM\JoinColumn(name="crucero_id", referencedColumnName="id")
     */
    private $crucero;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Servicio")
     * @ORM\JoinColumn(name="servicio_id", referencedColumnName="id")
     */
    private $servicio;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCrucero(): ?Crucero
    {
        return $this->crucero;
    }

    public function setCrucero(?Crucero $crucero): self
    {
        $this->crucero = $crucero;

        return $this;
    }

    public function getServicio(): ?Servicio
    {
        return $this->servicio;
    }

    public function setServicio(?Servicio $servicio): self
    {
        $this->servicio = $servicio;

        return $this;
    }
}
