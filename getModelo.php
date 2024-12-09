<?php
include_once "conexao.php";

$query_modelo = 'SELECT id, modelo FROM cimb_modelos';
$result_modelo = $conn->prepare($query_modelo);
$result_modelo->execute();

$modelos = $result_modelo->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($modelos);