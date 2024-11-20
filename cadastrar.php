<?php
include_once "conexao.php";

$dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

if (empty($dados['fld-nome-cpu'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o nome do pc. . . !</div>"];
} elseif (empty($dados['fld-ult-usuario'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o nome do último usuário. . . !</div>"];
} elseif (empty($dados['fld-servicetag_cpu'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o número de série. . . !</div>"];
} elseif (empty($dados['fld-sigla-setor'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher a coordenadoria . . . !</div>"];
} elseif (empty($dados['fld-nome-setor'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher 0 setor . . . !</div>"];
} elseif (empty($dados['fld-marca'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o campo marca . . . !</div>"];
} elseif (empty($dados['fld-modelo'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o campo modelo . . . !</div>"];
} else {
  $query_computador = "INSERT INTO CPUs (nome_cpu, coord_id,setor_id,ult_usuario,patrimonio_cpu,servicetag_cpu,office_email,office_senha,office_serial,marca_id,modelo_id) VALUES (:nome_cpu,:coord_id,:setor_id,:ult_usuario,:patrimonio_cpu,:servicetag_cpu,:office_email,:office_senha,:office_serial,:marca,:modelo)";

  $cad_computador = $conn->prepare($query_computador);
  $cad_computador->bindParam(':nome_cpu', $dados['fld-nome-cpu'], PDO::PARAM_STR);
  $cad_computador->bindParam(':coord_id', $dados['fld-sigla-setor'], PDO::PARAM_INT);
  $cad_computador->bindParam(':setor_id', $dados['fld-nome-setor'], PDO::PARAM_INT);
  $cad_computador->bindParam(':ult_usuario', $dados['fld-ult_usuario'], PDO::PARAM_STR);
  $cad_computador->bindParam(':patrimonio_cpu', $dados['fld-patrimonio_cpu'], PDO::PARAM_STR);
  $cad_computador->bindParam(':servicetag_cpu', $dados['fld-servicetag_cpu'], PDO::PARAM_STR);
  $cad_computador->bindParam(':office_email', $dados['fld-office_email'], PDO::PARAM_STR);
  $cad_computador->bindParam(':office_senha', $dados['fld-office_senha'], PDO::PARAM_STR);
  $cad_computador->bindParam(':office_serial', $dados['fld-office_serial'], PDO::PARAM_STR);
  $cad_computador->bindParam(':marca', $dados['fld-marca'], PDO::PARAM_INT);
  $cad_computador->bindParam(':modelo', $dados['fld-modelo'], PDO::PARAM_INT);

  $cad_computador->execute();

  if ($cad_computador->rowCount()) {
    $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-success' role='alert'>CPU cadastrada com sucesso . . . !</div>"];
  } else {
    $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Não foi possível cadastrar a CPU . . . !</div>"];
  }
}
echo json_encode($retorna);
