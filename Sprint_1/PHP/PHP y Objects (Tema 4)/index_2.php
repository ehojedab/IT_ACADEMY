<?php

class shape {

     //Atributos de la Clase
     protected $alto;
     protected $ancho;
 
     //Metodos
 
     public function inicializar($alt, $anc) {
 
         $this->alto = $alt;
         $this->ancho = $anc;
     }

}


class triagulo extends shape{

    public function cal_Area(){

        $area = ($this->alto*$this->ancho)/2; 
        echo "El area del Triangulo con Altura ".$this->alto." y Base ".$this->ancho." es ".$area.".<br>";


    }
}

class rectangulo extends shape{

    public function cal_Area(){

        $area = ($this->alto*$this->ancho);
        echo "El area del Rectangulo con Altura ".$this->alto." y Base ".$this->ancho." es ".$area.".<br>";

    }

}


$triagulo1 = new triagulo();
$triagulo1->inicializar(4,2);
echo $triagulo1->cal_Area();

$rectangulo1 = new rectangulo();
$rectangulo1->inicializar(4,2);
echo $rectangulo1->cal_Area();





?>