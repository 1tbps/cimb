<?php
include_once "conexao.php";

$query_marca = 'SELECT id, marca FROM cimb_marcas';
$result_marca = $conn->prepare($query_marca);
$result_marca->execute();

$marcas = $result_marca->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($marcas);