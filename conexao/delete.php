<?php
    include 'conexao.php';

    $id = $_POST['id'];
    $connect->query("delete from login where id=" $id);

    ?>