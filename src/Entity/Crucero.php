<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CruceroRepository")
 */
class Crucero
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
     * @ORM\Column(type="string", length=255)
     */
    private $destino;

    /**
     * @ORM\Column(type="text")
     */
    private $descripcion;

    /**
     * @ORM\Column(name="puerto_de_salida", type="string", length=255)
     */
    private $puertoDeSalida;

    /**
     * @ORM\Column(name="puerto_de_llegada", type="string", length=255)
     */
    private $puertoDeLlegada;

    /**
     * @ORM\Column(name="fecha_de_salida", type="date")
     */
    private $fechaDeSalida;

    /**
     * @ORM\Column(name="fecha_de_llegada", type="date")
     */
    private $fechaDeLlegada;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\TipoCrucero")
     * @ORM\JoinColumn(name="tipo_id", referencedColumnName="id")
     */
    private $tipo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $imagen;

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

    public function getDestino(): ?string
    {
        return $this->destino;
    }

    public function setDestino(string $destino): self
    {
        $this->destino = $destino;

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

    public function getPuertoDeSalida(): ?string
    {
        return $this->puertoDeSalida;
    }

    public function setPuertoDeSalida(string $puertoDeSalida): self
    {
        $this->puertoDeSalida = $puertoDeSalida;

        return $this;
    }

    public function getPuertoDeLlegada(): ?string
    {
        return $this->puertoDeLlegada;
    }

    public function setPuertoDeLlegada(string $puertoDeLlegada): self
    {
        $this->puertoDeLlegada = $puertoDeLlegada;

        return $this;
    }

    public function getFechaDeSalida(): ?\DateTimeInterface
    {
        return $this->fechaDeSalida;
    }

    public function setFechaDeSalida(\DateTimeInterface $fechaDeSalida): self
    {
        $this->fechaDeSalida = $fechaDeSalida;

        return $this;
    }

    public function getFechaDeLlegada(): ?\DateTimeInterface
    {
        return $this->fechaDeLlegada;
    }

    public function setFechaDeLlegada(\DateTimeInterface $fechaDeLlegada): self
    {
        $this->fechaDeLlegada = $fechaDeLlegada;

        return $this;
    }

    public function getTipo(): ?TipoCrucero
    {
        return $this->tipo;
    }

    public function setTipo(?TipoCrucero $tipo): self
    {
        $this->tipo = $tipo;

        return $this;
    }

    public function getImagen(): ?string
    {
        return $this->imagen;
    }

    public function setImagen(?string $imagen): self
    {
        $this->imagen = $imagen;

        return $this;
    }
}