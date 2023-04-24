<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ReservaRepository")
 */
class Reserva
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User")
     * @ORM\JoinColumn(nullable=false)
     */
    private $User;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Camarote")
     * @ORM\JoinColumn(nullable=false)
     */
    private $camarote;

    /**
     * @ORM\Column(type="datetime")
     */
    private $fecha_de_reserva;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUser(): ?User
    {
        return $this->User;
    }

    public function setUser(?User $User): self
    {
        $this->User = $User;

        return $this;
    }

    public function getCamarote(): ?Camarote
    {
        return $this->camarote;
    }

    public function setCamarote(?Camarote $camarote): self
    {
        $this->camarote = $camarote;

        return $this;
    }

    public function getFechaDeReserva(): ?\DateTimeInterface
    {
        return $this->fecha_de_reserva;
    }

    public function setFechaDeReserva(\DateTimeInterface $fecha_de_reserva): self
    {
        $this->fecha_de_reserva = $fecha_de_reserva;

        return $this;
    }
}