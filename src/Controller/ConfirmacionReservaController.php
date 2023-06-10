<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Dompdf\Dompdf;
use App\Entity\Crucero;
use App\Entity\Camarote;
use App\Entity\Servicio;
use App\Repository\CruceroRepository;
use App\Repository\CamaroteRepository;
use App\Repository\ServicioRepository;
use Symfony\Component\Routing\Annotation\Route;


class ConfirmacionReservaController extends AbstractController
{
    /**
    * @Route("/", name="confirmacion_reserva")
    */
   public function confirmacionReserva(\Swift_Mailer $mailer): Response
   {
       $crucero = /* Obtener el crucero de la reserva */;
       $camarote = /* Obtener el camarote de la reserva */;
       $servicio = /* Obtener el servicio de la reserva */;
       $fechaReserva = /* Obtener la fecha de la reserva */;

       $costeTotal = $this->calcularCosteTotal($camarote, $servicio);

       // Generar el archivo PDF con los datos de la reserva
       $pdf = $this->generarPDF($crucero, $camarote, $servicio, $fechaReserva, $costeTotal);

       // Enviar el correo electrónico con el archivo adjunto
       $this->enviarCorreo($mailer, $pdf);

       return $this->render('confirmacion_reserva/confirmacion_reserva.html.twig', [
           'crucero' => $crucero,
           'camarote' => $camarote,
           'servicio' => $servicio,
           'fechaReserva' => $fechaReserva,
           'costeTotal' => $costeTotal,
       ]);
   }

   /**
    * Calcula el coste total sumando los precios del crucero y los servicios adicionales.
    */
   private function calcularCosteTotal($camarote, $servicios): float
   {
       $costeTotal = $camarote->getPrecio();
       foreach ($servicios as $servicio) {
           $costeTotal += $servicio->getPrecio();
       }
       return $costeTotal;
   }

   /**
    * Genera el archivo PDF con los datos de la reserva.
    */
   private function generarPDF($crucero, $camarote, $servicio, $fechaReserva, $servicios, $costeTotal): string
   {
       $html = $this->renderView('pdf/reserva.html.twig', [
           'crucero' => $crucero,
           'camarote' => $camarote,
           'servicio' => $servicio,
           'fechaReserva' => $fechaReserva,
           'costeTotal' => $costeTotal,
       ]);

       // Cargar la biblioteca para generar PDF (por ejemplo, Dompdf)
       $dompdf = new Dompdf();
       $dompdf->loadHtml($html);
       $dompdf->render();

       // Guardar el archivo PDF en una ubicación temporal
       $pdfPath = '/ruta/para/guardar/archivo.pdf';
       file_put_contents($pdfPath, $dompdf->output());

       return $pdfPath;
   }

   /**
    * Envía el correo electrónico con el archivo PDF adjunto.
    */
   private function enviarCorreo($mailer, $pdfPath)
   {
       $message = (new \Swift_Message('Confirmación de reserva'))
           ->setFrom('tucorreo@example.com')
           ->setTo('destinatario@example.com')
           ->setBody(
               'Adjunto encontrarás la confirmación de tu reserva en formato PDF.'
           )
           ->attach(\Swift_Attachment::fromPath($pdfPath));

       $mailer->send($message);
   }
}

