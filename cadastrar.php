<?php
include_once "conexao.php";

$dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

if (empty($dados['fld-nome_cpu'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o nome do pc. . . !</div>"];
} elseif (empty($dados['fld-ult_usuario'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o nome do último usuário. . . !</div>"];
} elseif (empty($dados['fld-sigla_coord'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher a coordenadoria . . . !</div>"];
} elseif (empty($dados['fld-nome_setor'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher 0 setor . . . !</div>"];
} elseif (empty($dados['fld-marca'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o campo marca . . . !</div>"];
} elseif (empty($dados['fld-modelo'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o campo modelo . . . !</div>"];
} else {
  $query_cpu = " INSERT INTO cimb_cpus (nome_cpu, ult_usuario, patrimonio_cpu, servicetag_cpu, office_email, office_senha, office_serial, coord_id, setor_id, marca_id, modelo_id) VALUES (:nome_cpu,:ult_usuario,:patrimonio_cpu,:servicetag_cpu,:office_email,:office_senha,:office_serial,:coord_id,:setor_id,:marca,:modelo)";

  $cad_cpu = $conn->prepare($query_cpu);
  $cad_cpu->bindParam(':nome_cpu', $dados['fld-nome_cpu']);
  $cad_cpu->bindParam(':ult_usuario', $dados['fld-ult_usuario']);
  $cad_cpu->bindParam(':patrimonio_cpu', $dados['fld-patrimonio_cpu']);
  $cad_cpu->bindParam(':servicetag_cpu', $dados['fld-servicetag_cpu']);
  $cad_cpu->bindParam(':office_email', $dados['fld-office_email']);
  $cad_cpu->bindParam(':office_senha', $dados['fld-office_senha']);
  $cad_cpu->bindParam(':office_serial', $dados['fld-office_serial']);
  $cad_cpu->bindParam(':coord_id', $dados['fld-sigla_coord']);
  $cad_cpu->bindParam(':setor_id', $dados['fld-nome_setor']);
  $cad_cpu->bindParam(':marca', $dados['fld-marca']);
  $cad_cpu->bindParam(':modelo', $dados['fld-modelo']);

  $cad_cpu->execute();

  if ($cad_cpu->rowCount()) {
    $retorna = ['status' => true, 'msg' =>  "<div class='alert alert-success' role='alert'>CPU cadastrada com sucesso . . . !</div>"];
  } else {
    $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Não foi possível cadastrar a CPU . . . !</div>"];
  }
}
echo json_encode($retorna);
