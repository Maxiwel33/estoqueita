<?php
include 'conexao.php';

$queryResult= $connect->query("select * from login");

$result=array();

While($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;

}
echo json_encode($result);
?>