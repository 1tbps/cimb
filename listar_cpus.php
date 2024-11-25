<?php
include_once "conexao.php";

$dados_requisicao = $_REQUEST;

//Lista de colunas na tabela
$colunas = [
  0 => 'ID',
  1 => 'nome_cpu',
  2 => 'ult_usuario',
  3 => 'sigla_coord',
  4 => 'nome_setor',
  5 => 'marca',
  6 => 'modelo'
];

//Obter a quantidade de registros no banco de dados
$query_qnt_cpus = "SELECT COUNT(id) AS qnt_cpus FROM cimb_dispositivos";

if (!empty($dados_requisicao['search']['value'])) {
  $query_qnt_cpus .= " WHERE id LIKE :id ";
  $query_qnt_cpus .= " OR nome_cpu LIKE :nome_cpu ";
  $query_qnt_cpus .= " OR ult_usuario LIKE :ult_usuario ";
  $query_qnt_cpus .= " OR sigla_coord LIKE :sigla_coord ";
  $query_qnt_cpus .= " OR nome_setor LIKE :nome_setor ";
  $query_qnt_cpus .= " OR marca LIKE :marca ";
  $query_qnt_cpus .= " OR modelo LIKE :modelo ";
}

//Preparar a query
$result_qnt_cpus = $conn->prepare($query_qnt_cpus);

//Acessa o IF quando a paramtros de pesquisa
if (!empty($dados_requisicao['search']['value'])) {
  $valor_pesq = "%" . $dados_requisicao['search']['value'] . "%";
  $result_qnt_cpus->bindParam(':id', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_cpus->bindParam(':nome_cpu', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_cpus->bindParam(':ult_usuario', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_cpus->bindParam(':sigla_coord', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_cpus->bindParam(':nome_setor', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_cpus->bindParam(':marca', $valor_pesq, PDO::PARAM_STR);
  $result_qnt_cpus->bindParam(':modelo', $valor_pesq, PDO::PARAM_STR);
}

$result_qnt_cpus->execute();
$row_qnt_cpus = $result_qnt_cpus->fetch(PDO::FETCH_ASSOC);
//var_dump($row_qnt_cpus);

//Recuperar os registros do banco de dados
// $query_cpus = "SELECT * FROM Dispositivos ORDER BY id DESC LIMIT :inicio, :quantidade";
$query_cpus = "SELECT * FROM cimb_dispositivos ";

if (!empty($dados_requisicao['search']['value'])) {
  $query_cpus .= " WHERE ID LIKE :id ";
  $query_cpus .= " OR nome_cpu LIKE :nome_cpu ";
  $query_cpus .= " OR ult_usuario LIKE :ult_usuario ";
  $query_cpus .= " OR sigla_coord LIKE :sigla_coord ";
  $query_cpus .= " OR nome_setor LIKE :nome_setor ";
  $query_cpus .= " OR marca LIKE :marca ";
  $query_cpus .= " OR modelo LIKE :modelo ";
}
// Ordenar os registros
$query_cpus .= " ORDER BY " . $colunas[$dados_requisicao['order'][0]['column']] . " " . $dados_requisicao['order'][0]['dir'] . " LIMIT :inicio, :quantidade";
$result_cpus = $conn->prepare($query_cpus);
$result_cpus->bindParam(':inicio', $dados_requisicao['start'], PDO::PARAM_INT);
$result_cpus->bindParam(':quantidade', $dados_requisicao['length'], PDO::PARAM_INT);

//Acessa o IF quando a paramtros de pesquisa
if (!empty($dados_requisicao['search']['value'])) {
  $valor_pesq = "%" . $dados_requisicao['search']['value'] . "%";
  $result_cpus->bindParam(':id', $valor_pesq, PDO::PARAM_STR);
  $result_cpus->bindParam(':nome_cpu', $valor_pesq, PDO::PARAM_STR);
  $result_cpus->bindParam(':ult_usuario', $valor_pesq, PDO::PARAM_STR);
  $result_cpus->bindParam(':sigla_coord', $valor_pesq, PDO::PARAM_STR);
  $result_cpus->bindParam(':nome_setor', $valor_pesq, PDO::PARAM_STR);
  $result_cpus->bindParam(':marca', $valor_pesq, PDO::PARAM_STR);
  $result_cpus->bindParam(':modelo', $valor_pesq, PDO::PARAM_STR);
}
//Exectar a Query
$result_cpus->execute();

while ($row_cpu = $result_cpus->fetch(PDO::FETCH_ASSOC)) {
  //var_dump($row_cpus);
  extract($row_cpu);
  $registro = [];
  $registro[] = $id;
  $registro[] = $nome_cpu /*. " " . $colunas[$dados_requisicao['order'][0]['column']]*/;
  $registro[] = $ult_usuario;
  // $registro[] = $sigla_coord;
  $registro[] = $sigla_coord /*. " " . $dados_requisicao['order'][0]['dir']*/;
  $registro[] = $nome_setor;
  // $registro[] = $nome_coord;
  // $registro[] = $patrimonio_cpu;
  // $registro[] = $servicetag_cpu;
  // $registro[] = $office_email;
  // $registro[] = $office_senha;
  // $registro[] = $office_serial;
  $registro[] = $marca;
  $registro[] = $modelo;
  $registro[] = " <button class='border' type='button' id='$id' onclick='exiCPU($id)'><svg xmlns='http://www.w3.org/2000/svg' height='20px' viewBox='0 -960 960 960' width='20px' fill='#0D6EFD'><path d='M120-320v-80h320v80H120Zm0-160v-80h480v80H120Zm0-160v-80h480v80H120Zm520 520v-320l240 160-240 160Z'/></svg></button> 
  <button class='border' type='button' id='$id' onclick='ediCPU($id)'><svg xmlns='http://www.w3.org/2000/svg' height='20px' viewBox='0 -960 960 960' width='20px' fill='#DE9B04'><path d='M160-400v-80h280v80H160Zm0-160v-80h440v80H160Zm0-160v-80h440v80H160Zm360 560v-123l221-220q9-9 20-13t22-4q12 0 23 4.5t20 13.5l37 37q8 9 12.5 20t4.5 22q0 11-4 22.5T863-380L643-160H520Zm300-263-37-37 37 37ZM580-220h38l121-122-18-19-19-18-122 121v38Zm141-141-19-18 37 37-18-19Z'/></svg></button> 
  <button class='border' type='button' id='$id' onclick='excCPU($id)'><svg xmlns='http://www.w3.org/2000/svg' height='20px' viewBox='0 -960 960 960' width='20px' fill='#FF3405'><path d='m576-80-56-56 104-104-104-104 56-56 104 104 104-104 56 56-104 104 104 104-56 56-104-104L576-80ZM120-320v-80h280v80H120Zm0-160v-80h440v80H120Zm0-160v-80h440v80H120Z'/></svg></button>";
  $dados[] = $registro;
}
// var_dump($dados);

//Cria o objeto de informações a serem retornadas para o Javascript
$resultado = [
  "draw" => intval($dados_requisicao['draw']),
  "recordsTotal" => intval($row_qnt_cpus['qnt_cpus']),
  "recordsFiltered" => intval($row_qnt_cpus['qnt_cpus']),
  "data" => $dados

];
// var_dump($resultado);

echo json_encode($resultado);
