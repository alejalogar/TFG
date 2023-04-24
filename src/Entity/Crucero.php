<?php
// src/Entity/Crucero.php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity()
 * @ORM\Table(name="cruceros")
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
     * @ORM\OneToMany(targetEntity="App\Entity\Camarote", mappedBy="crucero")
     */
    private $camarotes;

    /**
 * Get the value of id
 */ 
public function getId()
{
    return $this->id;
}

/**
 * Set the value of id
 *
 * @return  self
 */ 
public function setId($id)
{
    $this->id = $id;

    return $this;
}

/**
 * Get the value of nombre
 */ 
public function getNombre()
{
    return $this->nombre;
}

/**
 * Set the value of nombre
 *
 * @return  self
 */ 
public function setNombre($nombre)
{
    $this->nombre = $nombre;

    return $this;
}

/**
 * Get the value of descripcion
 */ 
public function getDescripcion()
{
    return $this->descripcion;
}

/**
 * Set the value of descripcion
 *
 * @return  self
 */ 
public function setDescripcion($descripcion)
{
    $this->descripcion = $descripcion;

    return $this;
}

/**
 * Get the value of puertoDeSalida
 */ 
public function getPuertoDeSalida()
{
    return $this->puertoDeSalida;
}

/**
 * Set the value of puertoDeSalida
 *
 * @return  self
 */ 
public function setPuertoDeSalida($puertoDeSalida)
{
    $this->puertoDeSalida = $puertoDeSalida;

    return $this;
}

/**
 * Get the value of puertoDeLlegada
 */ 
public function getPuertoDeLlegada()
{
    return $this->puertoDeLlegada;
}

/**
 * Set the value of puertoDeLlegada
 *
 * @return  self
 */ 
public function setPuertoDeLlegada($puertoDeLlegada)
{
    $this->puertoDeLlegada = $puertoDeLlegada;

    return $this;
}

/**
 * Get the value of fechaDeSalida
 */ 
public function getFechaDeSalida()
{
    return $this->fechaDeSalida;
}

/**
 * Set the value of fechaDeSalida
 *
 * @return  self
 */ 
public function setFechaDeSalida($fechaDeSalida)
{
    $this->fechaDeSalida = $fechaDeSalida;

    return $this;
}

/**
 * Get the value of fechaDeLlegada
 */ 
public function getFechaDeLlegada()
{
    return $this->fechaDeLlegada;
}

/**
 * Set the value of fechaDeLlegada
 *
 * @return  self
 */ 
public function setFechaDeLlegada($fechaDeLlegada)
{
    $this->fechaDeLlegada = $fechaDeLlegada;

    return $this;
}

/**
 * Get the value of camarotes
 */ 
public function getCamarotes()
{
    return $this->camarotes;
}

/**
 * Set the value of camarotes
 *
 * @return  self
 */ 
public function setCamarotes($camarotes)
{
    $this->camarotes = $camarotes;

    return $this;
}
}