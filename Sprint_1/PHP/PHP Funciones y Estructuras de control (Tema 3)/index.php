<?php 

//---- EJERCICIO 1 ----

echo "EJERCICIO 1"."<br>"."<br>";


function par($num){
    if ($num%2 ==0){
       echo "El numero ".$num." es par";
       }else{
       echo "El numero ".$num." es impar";
       }  
}     

echo par(30)."<br>"."<br>";

//---- EJERCICIO 2 - 3 - 4 ----

echo "EJERCICIOS 2 - 3 - 4"."<br>"."<br>";

function contar($temporizador = 10){//Ejercicio 4

    for ($i=2; $i<=$temporizador; $i= $i +2){//Ejercicio 2 

         echo $i."<br>";
    }
}


echo contar(13)."<br>";// Ejercicio 3 // Se puede pasar otro parametro diferente al default. 


//---- EJERCICIO 5 ----  

echo "EJERCICIO 5"."<br>"."<br>";


function verificar_nota($nota){

    $respuesta = "";

    if($nota>0 && $nota <=100){

            if($nota == 0 && $nota<33){

                $respuesta = "El estudiante ha reprobado";

            }else if($nota==33 && $nota<=44){

                $respuesta = "El estudiante es de Tercera Division";

            }else if($nota>44 && $nota<=59){

                $respuesta = "El estudiante es de Segunda Division";

            }else{

                $respuesta = "El estudiante es de Primera Division";
            }

            return $respuesta;
            
    }else {
        echo "La nota no esta dentro del rango valido";
    }

}

echo verificar_nota(19)."<br>"."<br>";

?> 