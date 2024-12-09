<?php
include_once "conexao.php";

$query_coord = 'SELECT id, sigla_coord FROM cimb_coordenadorias';
$result_coord = $conn->prepare($query_coord);
$result_coord->execute();

$coordenadorias = $result_coord->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($coordenadorias);