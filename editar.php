<?php
include_once "conexao.php";

$dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
// $id=100;
// $id="";
if (empty($dados['id'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Tente mais tarde . . . !</div>"];
} elseif (empty($dados['fld-nome_cpu'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Insira o nome do pc . . . !</div>"];
} elseif (empty($dados['fld-ult_usuario'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Insira o nome do usuário . . . !</div>"];
} elseif (empty($dados['fld-sigla_coord'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Escolha na lista a coordenadoria de onde está o pc . . . !</div>"];
} elseif (empty($dados['fld-nome_setor'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Escolha na lista o setor de onde está o pc . . . !</div>"];
} elseif (empty($dados['fld-marca'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Escolha na lista a marca do pc . . . !</div>"];
} elseif (empty($dados['fld-modelo'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Escolha na lista o modelo pc . . . !</div>"];
} else {
  $query_cpu = "UPDATE cimb_cpus SET nome_cpu=:nome_cpu, ult_usuario=:ult_usuario, patrimonio_cpu=:patrimonio_cpu, servicetag_cpu=:servicetag_cpu, office_email=:office_email, office_senha=:office_senha, office_serial=:office_serial, coord_id=:coord_id, setor_id=:setor_id, marca_id=:marca_id, modelo_id=:modelo_id WHERE id=:id";
  $edi_cpu = $conn->prepare($query_cpu);
  $edi_cpu->bindParam(':nome_cpu', $dados['fld-nome_cpu']);
  $edi_cpu->bindParam(':ult_usuario', $dados['fld-ult_usuario']);
  $patrimonio_cpu = ($dados['fld-patrimonio_cpu'] == "") ? null : $dados['fld-patrimonio_cpu'];
  $edi_cpu->bindParam(':patrimonio_cpu', $patrimonio_cpu);
  $servicetag_cpu = ($dados['fld-servicetag_cpu'] == "") ? null : $dados['fld-servicetag_cpu'];
  $edi_cpu->bindParam(':servicetag_cpu', $servicetag_cpu);
  $office_email = ($dados['fld-office_email'] == "") ? null : $dados['fld-office_email'];
  $edi_cpu->bindParam(':office_email', $office_email);
  $office_senha = ($dados['fld-office_senha'] == "") ? null : $dados['fld-office_senha'];
  $edi_cpu->bindParam(':office_senha', $office_senha);
  $office_serial = ($dados['fld-office_serial'] == "") ? null : $dados['fld-office_serial'];
  $edi_cpu->bindParam(':office_serial', $office_serial);
  $edi_cpu->bindParam(':coord_id', $dados['fld-sigla_coord']);
  $edi_cpu->bindParam(':setor_id', $dados['fld-nome_setor']);
  $edi_cpu->bindParam(':marca_id', $dados['fld-marca']);
  $edi_cpu->bindParam(':modelo_id', $dados['fld-modelo']);
  $edi_cpu->bindParam(':id', $dados['id']);

  if ($edi_cpu->execute()) {
    $retorna = ['status' => true, 'msg' =>  "<div class='alert alert-success' role='alert'>CPU editada com sucesso . . . !</div>"];
  } else {
    $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>CPU não editada . . . !</div>"];
  }
}
echo json_encode($retorna);
