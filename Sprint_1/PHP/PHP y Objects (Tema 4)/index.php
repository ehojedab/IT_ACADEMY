<?php
 echo "Ejercicio 1 "."<br>";

//Ejericio 1 

 //Definir la Clase

  class empleado {

    //Atributos de la Clase
    private $nombre;
    private $salario;

    //Metodos de la clase

    public function inicializar($nom, $sal) {

        $this->nombre = $nom;
        $this->salario = $sal;
    }

    public function imprimir(){
        
        if($this->salario<6000){
            echo "El empleado: ". $this->nombre.", con un Salario de: ".$this->salario. " Euros, NO tiene que Pagar impuestos"."<br>";
           }else{
            echo "El empleado: ". $this->nombre.", con un Salario de: ".$this->salario. " Euros, tiene que Declarar impuestos"."<br>";
   
           }
    
    }    
 
 }

// inicializar e imprimir Objetos clase empleado

 $empleado1 = new empleado();
 $empleado1->inicializar("Havier", 1600);
 $empleado1->imprimir();

 $empleado2 = new empleado();
 $empleado2->inicializar("Urzula", 6400);
 $empleado2->imprimir();


?>