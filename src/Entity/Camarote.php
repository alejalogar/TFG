<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CamaroteRepository")
 */
class Camarote
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
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
     * @ORM\Column(name="tipo_de_cama", type="string", length=255)
     */
    private $tipoDeCama;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2)
     */
    private $precio;

    /**
     * @ORM\Column(name="cantidad_disponible", type="integer")
     */
    private $cantidadDisponible;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Crucero", inversedBy="camarotes")
     * @ORM\JoinColumn(name="crucero_id", referencedColumnName="id")
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
        return $this->tipoDeCama;
    }

    public function setTipoDeCama(string $tipoDeCama): self
    {
        $this->tipoDeCama = $tipoDeCama;

        return $this;
    }

    public function getPrecio(): ?float
    {
        return $this->precio;
    }

    public function setPrecio(float $precio): self
    {
        $this->precio = $precio;

        return $this;
    }

    public function getCantidadDisponible(): ?int
    {
        return $this->cantidadDisponible;
    }

    public function setCantidadDisponible(int $cantidadDisponible): self
    {
        $this->cantidadDisponible = $cantidadDisponible;

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
