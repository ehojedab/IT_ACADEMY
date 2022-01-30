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

?> 