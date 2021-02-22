<?php

namespace App\Subscriber;

use App\Events\PresupuestoCreadoEvents;
use App\Service\Mailer\MailerService;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class PresupuestoCreadoSubscriber implements EventSubscriberInterface
{
    private $mailer;

    public function __construct(MailerService $mailer)
    {
        $this->mailer = $mailer;
    }
    public static function getSubscribedEvents()
    {
        return array(
            'presupuesto.creado' => 'enviarCorreoSolicitado',
        );
    }

    public function  enviarCorreoSolicitado(PresupuestoCreadoEvents $event)
    {
        $presupuesto = $event;
        dump($presupuesto);
    }
}
