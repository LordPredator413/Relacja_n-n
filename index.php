<html>
 <head>
  <meta charset="utf-8">
  <title>Samochody</title>
  <link rel="stylesheet" type="text/css" href="styl.css" />
 </head>
 <body>
 
  <center>
  <div>
  <h1>Dodawanie do bazy</h1>
  <h7>Relacja wiele do wielu</h7>
  </br></br></br>
  <form method="get" action="insert.php">
   <table border="0">
      
      <tr><td>PESEL</td><td><select name="pesel">
          
          
          
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
          
if ($sql =  $baza->prepare("SELECT pesel FROM wlasciciel"))
{
        $sql->execute();
        $sql->bind_result($PESEL);
        while ($sql->fetch())
        {
                echo "<option>$PESEL</option>";
        }
        $sql->close();
 }
else die( "Błąd w zapytaniu SQL! Sprawdź kod SQL w PhpMyAdmin: ". $baza->error );

 
?>
                    
          </select></td></tr>
       <tr><td>VIN</td><td><select name="vin">
          
          
          <?php

          
if ($sql =  $baza->prepare("SELECT VIN FROM samochód"))
{
        $sql->execute();
        $sql->bind_result($VIN);
        while ($sql->fetch())
        {
                echo "<option>$VIN</option>";
        }
        $sql->close();
 }
else die( "Błąd w zapytaniu SQL! Sprawdź kod SQL w PhpMyAdmin: ". $baza->error );

 
?>
          

          
          </select></td></tr>
       
      <tr><td colspan="2"><input type="submit" value="wstaw"></td></tr>
   </table>
  </form>
     
 </body>
 </div>
 </center>
 
</html>