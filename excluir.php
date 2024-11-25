<?php
include_once "conexao.php";

$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
// $id = "";
if (!empty($id)) {
  $query_cpu = "DELETE FROM cimb_cpus WHERE id=:id limit 1";
  $result_cpu = $conn->prepare($query_cpu);
  $result_cpu->bindParam(':id', $id, PDO::PARAM_INT);

  if ($result_cpu->execute()) {
    $retorna = ['status' => true, 'msg' =>  "<div class='alert alert-success' role='alert'>CPU excluída . . . !</div>"];
  } else {
    $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>CPU não excluída . . . !</div>"];
  }
} else {
  $retorna = ['status' => false, 'msg' =>  "<div class='alert alert-danger' role='alert'>CPU não excluída . . . !</div>"];
}
echo json_encode($retorna);
