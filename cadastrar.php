<?php
include_once "conexao.php";

$dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

if (empty($dados['fld-nome-cpu'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o nome do pc. . . !</div>"];
} 
elseif (empty($dados['fld-ult-usuario'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o nome do último usuário. . . !</div>"];
} 
elseif (empty($dados['fld-sigla-setor'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher a coordenadoria . . . !</div>"];
} 
elseif (empty($dados['fld-nome-setor'])) {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher 0 setor . . . !</div>"];
// } 
// elseif (empty($dados['marca'])) {
//   $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o campo marca . . . !</div>"];
// } 
// elseif (empty($dados['modelo'])) {
//   $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Necessário preencher o campo modelo . . . !</div>"];

} else {
  // $query_computador = "INSERT INTO "
}
echo json_encode($retorna);
