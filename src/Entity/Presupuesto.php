<?php

namespace App\Entity;

use App\Repository\PresupuestoRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PresupuestoRepository::class)
 */
class Presupuesto
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
    private $numero;

    /**
     * @ORM\Column(type="date")
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $concepto;

    /**
     * @ORM\Column(type="integer")
     */
    private $cantidad;

    /**
     * @ORM\Column(type="float")
     */
    private $price;

    /**
     * @ORM\Column(type="float")
     */
    private $total;

    /**
     * @ORM\Column(type="date")
     */
    private $validoHasta;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $Informacion;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNumero(): ?string
    {
        return $this->numero;
    }

    public function setNumero(string $numero): self
    {
        $this->numero = $numero;

        return $this;
    }

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getConcepto(): ?string
    {
        return $this->concepto;
    }

    public function setConcepto(string $concepto): self
    {
        $this->concepto = $concepto;

        return $this;
    }

    public function getCantidad(): ?int
    {
        return $this->cantidad;
    }

    public function setCantidad(int $cantidad): self
    {
        $this->cantidad = $cantidad;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setprice(float $price): self
    {
        $this->price;

        return $this;
    }

    public function getTotal(): ?float
    {
        return $this->total;
    }

    public function setTotal(float $total): self
    {
        $this->total = $total;

        return $this;
    }

    public function getValidoHasta(): ?\DateTimeInterface
    {
        return $this->validoHasta;
    }

    public function setValidoHasta(\DateTimeInterface $validoHasta): self
    {
        $this->validoHasta = $validoHasta;

        return $this;
    }

    public function getInformacion(): ?string
    {
        return $this->Informacion;
    }

    public function setInformacion(?string $Informacion): self
    {
        $this->Informacion = $Informacion;

        return $this;
    }
}
