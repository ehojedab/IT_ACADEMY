<?php

//---- EJERCICIO 1 ----

echo "EJERCICIO 1"."<br>"."<br>";

//Definir variable
$a_integer =2022;
//Imprimir variable concatenada
echo "Integer = ".$a_integer.", ";

$b_double = 2.022;
echo "Double = ".$b_double."," ."\n";

$c_string = "Soy una variable de tipo String";
echo "String = ".$c_string .",".PHP_EOL;

$d_boolean = true;
echo "Boolean = ".$d_boolean ."<br>";

//todas las variables concatenadas con salto de linea.
echo $a_integer."<br>". $b_double."<br>". $c_string."<br>".$d_boolean."<br>"."<br>";

//---- EJERCICIO 2 ---- 

echo "EJERCICIO 2"."<br>"."<br>";

$saludo = "Hello, Wordl!";

$saludo_Mayusculas = strtoupper($saludo);//funcon pasa todos los carateres a Mayuscula (STR=>String)

echo strlen($saludo)."<br>"; //funcion - Tambien se cuentan los espacios en la longitud del String. 

echo strrev($saludo)."<br>";//funcion - Invierte el String.

$curso = "Este es el curso de PHP";

echo $saludo, $curso,"<br>","<br>"; //Se puede concatenar con (,)




//---- EJERCICIO 3 ----

print "EJERCICIO 3"."<br>";

define('NOMBRE', 'Havier Ojeda');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
     <h1>
        <?php 
        print NOMBRE;//Print no concatena varias variables. 
         ?> 
     </h1>
     <br>
</body>
</html>

<?php 
       
       //---- EJERCICIO 4----

print "EJERCICIO 4"."<br>"."<br>";

$X = 7;
$Y = 3;

echo "X es = ".$X.", Y es = ".$Y."<br>";

$suma = $X + $Y;
echo "X + Y  = ".$suma."<br>";

$resta = $X - $Y;
echo "X - Y  = ".$resta."<br>";

$producto = $X * $Y;
echo "X * Y  = ".$producto."<br>";

$modulo = $X % $Y;
echo "X % Y  = ".$modulo."<br>"."<br>";

//----------------------------------------------------------------

$N = 8.8;
$M = 2.5;

echo "N es = ".$N.", M es = ".$M."<br>";

$suma = $N + $M;
echo "N + M  = ".$suma."<br>";

$resta = $N - $M;
echo "N - M  = ".$resta."<br>";

$producto = $N * $M;
echo "N * M  = ".$producto."<br>";

$modulo = $N % $M;
echo "N % M  = ".$modulo."<br>";//Convierte primero a integer.

$modulo_float = fmod($N, $M);
echo "N % M  = ".$modulo_float."<br>"."<br>";//Funcion que opera el modulo directo con . flotante

//----------------------------------------------------------------

echo "El doble de X es ".($X*2)."<br>";
echo "El doble de Y es ".($Y*2)."<br>";
echo "El doble de N es ".($N*2)."<br>";
echo "El doble de M es ".($M*2)."<br>"."<br>";

$suma_total = $X + $Y + $N + $M;
echo "La suma de todas las variables es ".$suma_total."<br>";

$producto_total = $X * $Y * $N * $M;
echo "El producto de todas las variables es ".$producto_total."<br>"."<br>";


  ?> 