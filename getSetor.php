<?php
include_once "conexao.php";

$query_setor = 'SELECT id, nome_setor FROM cimb_setores';
$result_setor = $conn->prepare($query_setor);
$result_setor->execute();

$setores = $result_setor->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($setores);