<?php

namespace App\Controller;

use App\Entity\Alumno;
use App\Entity\Asignatura;
use App\Entity\Nota;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AsignaturaController extends AbstractController
{
    /**
     * @Route("/asignatura/{id}", name="verAsignatura")
     */
    public function index($id): Response
    {
        $asignatura = $this->getDoctrine()->getRepository(Asignatura::class)->find($id);

        return $this->render('asignatura/index.html.twig', [
            'asignatura' => $asignatura,
        ]);
    }
}
