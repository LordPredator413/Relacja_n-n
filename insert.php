<?php

function wczytaj($zmienna)
{
           if (!isset($_GET[$zmienna]) || $_GET[$zmienna]=="")
                die( "Blad! brak zmiennej: ".$zmienna ); // nie podano marki w $
           return $_GET[$zmienna];
}

$baza = new  mysqli("localhost", "root", "", "samochody");
if (mysqli_connect_errno())  die( "Blad: ".mysqli_connect_error() );
$baza->set_charset("utf8");

$PESEL = wczytaj("pesel");
$VIN = wczytaj("vin");


$sql = $baza->prepare("INSERT INTO posiada VALUES (?, ?);");
if ($sql)
{
        $sql->bind_param("ss", $VIN, $PESEL);
        $sql->execute();
        $sql->close();
}
else
    die( 'Błąd: '. $baza->error);
$baza->close();
header ("Location: http://127.0.0.1/index.php");
?>