<?php

declare(strict_types=1);

namespace App\Service\Mailer;

use Mailer\Templating\TwigTemplate;
use Psr\Log\LoggerInterface;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Twig\Environment;

class MailerService
{
    /**
     * @var MailerInterface
     */
    private $mailer;

    /**
     * @var Environment
     */
    private $engine;

    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * @var string
     */
    private $mailerDefaultSender;

    public function __construct(
        MailerInterface $mailer,
        Environment $engine,
        LoggerInterface $logger,
        string $mailerDefaultSender
    ) {
        $this->mailer = $mailer;
        $this->engine = $engine;
        $this->logger = $logger;
        $this->mailerDefaultSender = $mailerDefaultSender;
    }
    /**
     * Servicio que gestiona el envío de correo
     */
    public function send(string $receiver, string $template, array $payload): void
    {}
}
