<?php

namespace App\Events;

use Symfony\Contracts\EventDispatcher\Event;

class PresupuestoCreadoEvents extends Event
{
    private $presupuesto;

    public function __construct($presupuesto)
    {
        $this->presupuesto = $presupuesto;
    }

    public function getPresupuesto()
    {
        return $this->presupuesto;
    }
}
