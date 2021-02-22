<?php

namespace App\Controller;

use App\Entity\Presupuesto;
use App\Events\PresupuestoCreadoEvents;
use App\Form\PresupuestoType;
use App\Repository\PresupuestoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/presupuesto")
 */
class PresupuestoController extends AbstractController
{
    /**
     * @Route("/", name="presupuesto_index", methods={"GET"})
     */
    public function index(PresupuestoRepository $presupuestoRepository): Response
    {
        return $this->render('presupuesto/index.html.twig', [
            'presupuestos' => $presupuestoRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="presupuesto_new", methods={"GET","POST"})
     */
    public function new(Request $request, EventDispatcherInterface $dispacher): Response
    {
        $presupuesto = new Presupuesto();
        $form = $this->createForm(PresupuestoType::class, $presupuesto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($presupuesto);
            $entityManager->flush();
            $infoEvento = new PresupuestoCreadoEvents($presupuesto);
            $dispacher->dispatch($infoEvento, 'presupuesto.creado');

            return $this->redirectToRoute('presupuesto_index');
        }

        return $this->render('presupuesto/new.html.twig', [
            'presupuesto' => $presupuesto,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="presupuesto_show", methods={"GET"})
     */
    public function show(Presupuesto $presupuesto): Response
    {
        return $this->render('presupuesto/show.html.twig', [
            'presupuesto' => $presupuesto,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="presupuesto_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Presupuesto $presupuesto): Response
    {
        $form = $this->createForm(PresupuestoType::class, $presupuesto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('presupuesto_index');
        }

        return $this->render('presupuesto/edit.html.twig', [
            'presupuesto' => $presupuesto,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="presupuesto_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Presupuesto $presupuesto): Response
    {
        if ($this->isCsrfTokenValid('delete'.$presupuesto->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($presupuesto);
            $entityManager->flush();
        }

        return $this->redirectToRoute('presupuesto_index');
    }
}
