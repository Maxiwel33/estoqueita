<?php
    include 'conexao.php';
    $id = $_POST['id'];
    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];

    $connect->query("UPDATE login SET usuario ='"$usuario"', senha = '"$senha"' where id =" $id);
    

    ?>