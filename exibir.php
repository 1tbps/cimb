<?php
include_once "conexao.php";

$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
// $id=100;
// $id="";
if (!empty($id)) {
  $query_cpu = "SELECT * FROM `cimb_dispositivos` WHERE id=:id limit 1";
  $result_cpu = $conn->prepare($query_cpu);
  $result_cpu->bindParam(':id', $id);
  $result_cpu->execute();

  if (($result_cpu) and ($result_cpu->rowCount() != 0)) {
    $row_cpu = $result_cpu->fetch(PDO::FETCH_ASSOC);
    $retorna = ['status' => true, 'dados' =>  $row_cpu];
  } else {
    $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Não foi possível exibir a CPU . . . !</div>"];
  }
} else {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>Não foi possível exibir a CPU . . . !</div>"];
}
echo json_encode($retorna);
