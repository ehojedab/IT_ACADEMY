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



//---- EJERCICIO 5----

print "EJERCICIO 5"."<br>"."<br>";

$array_1 = array(3,5,6,4,8);
//echo $array_1[3]."<br>";

$array_2 = array(9,7,0);
array_push($array_2,1);//Agrega elementos a mi array_push ($array, elemento)
//echo $array_2[3];

$array_resultante = array_merge($array_1, $array_2);//Combina los elementos de 2 o mas arrays, 
//el orden ($array_1, $array_2)  define como se anexan
echo "El tamaño del Array resultante es ".count($array_resultante)."<br>";
print_r($array_resultante);


  ?> 