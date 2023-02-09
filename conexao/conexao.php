<?php
$connect = new mysqli("localhost", "root","estoque");

if($connect){
    echo "Falha, veja o seu IP ou Firewall";
    exit();
}
?>