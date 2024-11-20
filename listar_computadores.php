<?php
include_once "./conexao.php";

$dados_requisicao = $_REQUEST;

//Lista de colunas na tabela
$colunas = [
  0 => 'ID',
  1 => 'nome_cpu',
  2 => 'ult_usuario',
  3 => 'sigla_setor',
  4 => 'nome_setor',
  5 => 'marca',
  6 => 'modelo'
];

//Obter a quantidade de registros no banco de dados
$query_qnt_computadores = "SELECT COUNT(id) AS qnt_computadores FROM Dispositivos";

if (!empty($dados_requisicao['search']['value'])) {
  $query_qnt_computadores .= " WHERE ID LIKE :ID ";
  $query_qnt_computadores .= " OR nome_cpu LIKE :nome_cpu ";
  $query_qnt_computadores .= " OR ult_usuario LIKE :ult_usuario ";
  $query_qnt_computadores .= " OR sigla_setor LIKE :sigla_setor ";
  $query_qnt_computadores .= " OR nome_setor LIKE :nome_setor ";
  $query_qnt_computadores .= " OR marca LIKE :marca ";
  $query_qnt_computadores .= " OR modelo LIKE :modelo ";
}

//Preparar a query
$result_qnt_computadores = $conn->prepare($query_qnt_computadores);

//Acessa o IF quando a paramtros de pesquisa
if (!empty($dados_requisicao['search']['value'])) {
  $valor_pesq = "%" . $dados_requisicao['search']['value'] . "%";
  $result_qnt_computadores->bindParam(':ID', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_computadores->bindParam(':nome_cpu', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_computadores->bindParam(':ult_usuario', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_computadores->bindParam(':sigla_setor', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_computadores->bindParam(':nome_setor', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_computadores->bindParam(':marca', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_computadores->bindParam(':modelo', $valor_pesq, PDO::PARAM_STR);
}

$result_qnt_computadores->execute();
$row_qnt_computadores = $result_qnt_computadores->fetch(PDO::FETCH_ASSOC);
//var_dump($row_qnt_computadores);

//Recuperar os registros do banco de dados
// $query_computadores = "SELECT * FROM Dispositivos ORDER BY id DESC LIMIT :inicio, :quantidade";
$query_computadores = "SELECT ID,nome_cpu,ult_usuario,sigla_setor,nome_setor,marca,modelo FROM Dispositivos ";

if (!empty($dados_requisicao['search']['value'])) {
  $query_computadores .= " WHERE ID LIKE :ID ";
  $query_computadores .= " OR nome_cpu LIKE :nome_cpu ";
  $query_computadores .= " OR ult_usuario LIKE :ult_usuario ";
  $query_computadores .= " OR sigla_setor LIKE :sigla_setor ";
  $query_computadores .= " OR nome_setor LIKE :nome_setor ";
  $query_computadores .= " OR marca LIKE :marca ";
  $query_computadores .= " OR modelo LIKE :modelo ";
}
// Ordenar os registros
$query_computadores .= " ORDER BY " . $colunas[$dados_requisicao['order'][0]['column']] . " " . $dados_requisicao['order'][0]['dir'] . " LIMIT :inicio, :quantidade";
$result_computadores = $conn->prepare($query_computadores);
$result_computadores->bindParam(':inicio', $dados_requisicao['start'], PDO::PARAM_INT);
$result_computadores->bindParam(':quantidade', $dados_requisicao['length'], PDO::PARAM_INT);

//Acessa o IF quando a paramtros de pesquisa
if (!empty($dados_requisicao['search']['value'])) {
  $valor_pesq = "%" . $dados_requisicao['search']['value'] . "%";
  $result_computadores->bindParam(':ID', $valor_pesq, PDO::PARAM_STR);
  $result_computadores->bindParam(':nome_cpu', $valor_pesq, PDO::PARAM_STR);
  $result_computadores->bindParam(':ult_usuario', $valor_pesq, PDO::PARAM_STR);
  $result_computadores->bindParam(':sigla_setor', $valor_pesq, PDO::PARAM_STR);
  $result_computadores->bindParam(':nome_setor', $valor_pesq, PDO::PARAM_STR);
  $result_computadores->bindParam(':marca', $valor_pesq, PDO::PARAM_STR);
  $result_computadores->bindParam(':modelo', $valor_pesq, PDO::PARAM_STR);
}
//Exectar a Query
$result_computadores->execute();

while ($row_computador = $result_computadores->fetch(PDO::FETCH_ASSOC)) {
  //var_dump($row_computadores);
  extract($row_computador);
  $registro = [];
  $registro[] = $ID;
  $registro[] = $nome_cpu /*. " " . $colunas[$dados_requisicao['order'][0]['column']]*/;
  $registro[] = $ult_usuario;
  // $registro[] = $sigla_coord;
  $registro[] = $sigla_setor /*. " " . $dados_requisicao['order'][0]['dir']*/;
  $registro[] = $nome_setor;
  // $registro[] = $nome_coord;
  // $registro[] = $patrimonio_cpu;
  // $registro[] = $servicetag_cpu;
  // $registro[] = $office_email;
  // $registro[] = $office_senha;
  // $registro[] = $office_serial;
  $registro[] = $marca;
  $registro[] = $modelo;
  $dados[] = $registro;
}
// var_dump($dados);

//Cria o objeto de informações a serem retornadas para o Javascript
$resultado = [
  "draw" => intval($dados_requisicao['draw']),
  "recordsTotal" => intval($row_qnt_computadores['qnt_computadores']),
  "recordsFiltered" => intval($row_qnt_computadores['qnt_computadores']),
  "data" => $dados

];
// var_dump($resultado);

echo json_encode($resultado);
