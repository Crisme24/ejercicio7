<?php

namespace App\Controller;

use App\Entity\Alumno;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AlumnoController extends AbstractController
{
    /**
     * @Route("/alumnos", name="alumnos")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Alumno::class);

        $alumnos = $repository->findAll();

        return $this->render('alumno/index.html.twig', [
            'alumnos' => $alumnos,
        ]);
    }
}
