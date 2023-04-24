<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="camarotes")
 */
class Camarote
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombre;

    /**
     * @ORM\Column(type="text")
     */
    private $descripcion;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $tipo_de_cama;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2)
     */
    private $precio;

    /**
     * @ORM\Column(type="integer")
     */
    private $cantidad_disponible;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Crucero", inversedBy="camarotes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $crucero;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(string $descripcion): self
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function getTipoDeCama(): ?string
    {
        return $this->tipo_de_cama;
    }

    public function setTipoDeCama(string $tipo_de_cama): self
    {
        $this->tipo_de_cama = $tipo_de_cama;

        return $this;
    }

    public function getPrecio(): ?string
    {
        return $this->precio;
    }

    public function setPrecio(string $precio): self
    {
        $this->precio = $precio;

        return $this;
    }

    public function getCantidadDisponible(): ?int
    {
        return $this->cantidad_disponible;
    }

    public function setCantidadDisponible(int $cantidad_disponible): self
    {
        $this->cantidad_disponible = $cantidad_disponible;

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
}