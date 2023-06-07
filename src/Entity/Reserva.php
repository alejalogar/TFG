<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ReservaRepository")
 *@ORM\Table(name="reservas")
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
     * @ORM\JoinColumn(name="usuario_id", referencedColumnName="id")
     */
    private $usuario;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Camarote")
     * @ORM\JoinColumn(name="camarote_id", referencedColumnName="id")
     */
    private $camarote;

    /**
     * @ORM\Column(name="fecha_de_reserva", type="datetime")
     */
    private $fechaDeReserva;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsuario(): ?User
    {
        return $this->usuario;
    }

    public function setUsuario(?User $usuario): self
    {
        $this->usuario = $usuario;

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
        return $this->fechaDeReserva;
    }

    public function setFechaDeReserva(\DateTimeInterface $fechaDeReserva): self
    {
        $this->fechaDeReserva = $fechaDeReserva;

        return $this;
    }
}
