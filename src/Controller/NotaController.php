<?php

namespace App\Controller;

use App\Entity\Alumno;
use App\Entity\Nota;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class NotaController extends AbstractController
{
    /**
     * @Route("/notas/{id}", name="verNotas")
     */
    public function verNotas($id): Response
    {
        $em = $this->getDoctrine()->getManager();
        $alumno = $this->getDoctrine()->getRepository(Alumno::class)->find($id);
        $notas = $em->getRepository(Nota::class)->findByAlumno($alumno->getId());

        return $this->render('nota/index.html.twig', [
            'notas' => $notas,
        ]);
    }
}
