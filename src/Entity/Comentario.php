<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ComentarioRepository")
 * @ORM\Table(name="comentarios")
 */
class Comentario
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
     * @ORM\ManyToOne(targetEntity="App\Entity\Crucero")
     * @ORM\JoinColumn(name="crucero_id", referencedColumnName="id")
     */
    private $crucero;

    /**
     * @ORM\Column(type="text")
     */
    private $comentario;

    /**
     * @ORM\Column(name="fecha_de_comentario", type="datetime")
     */
    private $fechaDeComentario;

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

    public function getCrucero(): ?Crucero
    {
        return $this->crucero;
    }

    public function setCrucero(?Crucero $crucero): self
    {
        $this->crucero = $crucero;

        return $this;
    }

    public function getComentario(): ?string
    {
        return $this->comentario;
    }

    public function setComentario(string $comentario): self
    {
        $this->comentario = $comentario;

        return $this;
    }

    public function getFechaDeComentario(): ?\DateTimeInterface
    {
        return $this->fechaDeComentario;
    }

    public function setFechaDeComentario(\DateTimeInterface $fechaDeComentario): self
    {
        $this->fechaDeComentario = $fechaDeComentario;

        return $this;
    }
}
