<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" href="img/favicon-96x96.png" sizes="96x96" />
  <link rel="icon" type="image/svg+xml" href="img/favicon.svg" />
  <link rel="shortcut icon" href="img/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CIMB</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/dataTables.bootstrap5.css">
</head>

<body>
  <div class="container">
    <div class="d-flex justify-content-between align-items-center pt-3">
      <h1 style="margin-bottom: 0px;">CIMB</h1>
      <div class="d-flex justify-content-between align-items-center gap-3">
        <h3 style="margin-bottom: 0px;">Cadastrar</h3>
        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#cadastro-cpu-modal">CPUs</button>
        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#">Monitores</button>
        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#">Marcas</button>
        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#">Modelos</button>
      </div>
    </div>
    <hr class="pb-2">
    <span id="msgAlerta"></span>
    <table id="listar-cpus" class="table table-striped table-hover display" style="width:100%">
      <thead>
        <tr>
          <th>ID</th>
          <th>NOME PC</th>
          <th>ÚLTIMO USUÁRIO</th>
          <th>COORD.</th>
          <th>SETOR</th>
          <th>MARCA</th>
          <th>MODELO</th>
          <th>AÇÕES</th>
        </tr>
      </thead>
    </table>
  </div>

  <div class="modal fade" id="cadastro-cpu-modal" tabindex="-1" aria-labelledby="cad-cpu-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="cad-cpu-modal-label">Inserir Registros</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <span id="msgAlertErroCad"></span>
          <form class="row g-3" method="POST" id="form-cad-comp">
            <div class="col-md-6">
              <label for="fld-nome_cpu" class="form-label">Nome PC</label>
              <input type="text" name="fld-nome_cpu" class="form-control" id="fld-nome_cpu" placeholder="Nome Completo">
            </div>
            <div class="col-md-6">
              <label for="fld-ult_usuario" class="form-label">Último Usuário</label>
              <input type="text" name="fld-ult_usuario" class="form-control" id="fld-ult_usuario" placeholder="Primeiro Nome">
            </div>
            <div class="col-md-6">
              <label for="fld-patrimonio_cpu" class="form-label">Patrimônio da CPU</label>
              <input type="text" name="fld-patrimonio_cpu" class="form-control" id="fld-patrimonio_cpu" placeholder="">
            </div>
            <div class="col-md-6">
              <label for="fld-servicetag_cpu" class="form-label">Service Tag</label>
              <input type="text" name="fld-servicetag_cpu" class="form-control" id="fld-servicetag_cpu" placeholder="">
            </div>
            <div class="col-md-9">
              <label for="fld-office_email" class="form-label">E-Mail do Office</label>
              <input type="email" name="fld-office_email" class="form-control" id="fld-office_email" placeholder="">
            </div>
            <div class="col-md-3">
              <label for="fld-office_senha" class="form-label">Senha do Office</label>
              <input type="text" name="fld-office_senha" class="form-control" id="fld-office_senha" placeholder="">
            </div>
            <div class="col-md-9">
              <label for="fld-office_serial" class="form-label">Serial do Office</label>
              <input type="text" name="fld-office_serial" class="form-control" id="fld-office_serial" placeholder="">
            </div>
            <div class="col-md-3">
              <label for="fld-sigla_coord" class="form-label">Coord.</label>
              <select name="fld-sigla_coord" id="fld-sigla_coord" class="form-select">
                <option value="">Selecione a Coord.</option>
                <?php
                include_once "conexao.php";

                $query_coord = 'SELECT id, sigla_coord FROM Coordenadorias';
                $result_coord = $conn->prepare($query_coord);
                $result_coord->execute();

                while ($row_coord = $result_coord->fetch(PDO::FETCH_ASSOC)) {
                  extract($row_coord);
                  echo '<option value="' . $id . '">' . $sigla_coord . '</option>';
                }

                ?>
              </select>
            </div>
            <div class="col-md-12">
              <label for="fld-nome_setor" class="form-label">Setor</label>
              <select name="fld-nome_setor" id="fld-nome_setor" class="form-select">
                <option value="">Selecione o Setor</option>
                <?php
                include_once "conexao.php";

                $query_setor = 'SELECT id, nome_setor FROM Setores';
                $result_setor = $conn->prepare($query_setor);
                $result_setor->execute();

                while ($row_setor = $result_setor->fetch(PDO::FETCH_ASSOC)) {
                  extract($row_setor);
                  echo '<option value="' . $id . '">' . $nome_setor . '</option>';
                }

                ?>
              </select>
            </div>
            <div class="col-md-6">
              <label for="fld-marca" class="form-label">Marca</label>
              <select name="fld-marca" id="fld-marca" class="form-select">
                <option value="">Selecione a Marca</option>
                <?php
                include_once "conexao.php";

                $query_marca = 'SELECT id, marca FROM Marcas';
                $result_marca = $conn->prepare($query_marca);
                $result_marca->execute();

                while ($row_marca = $result_marca->fetch(PDO::FETCH_ASSOC)) {
                  extract($row_marca);
                  echo '<option value="' . $id . '">' . $marca . '</option>';
                }
                ?>
              </select>
            </div>
            <div class="col-md-6">
              <label for="fld-modelo" class="form-label">Modelo</label>
              <select name="fld-modelo" id="fld-modelo" class="form-select">
                <option value="">Selecione o Modelo</option>
                <?php
                include_once "conexao.php";

                $query_modelo = 'SELECT id, modelo FROM Modelos';
                $result_modelo = $conn->prepare($query_modelo);
                $result_modelo->execute();

                while ($row_modelo = $result_modelo->fetch(PDO::FETCH_ASSOC)) {
                  extract($row_modelo);
                  echo '<option value="' . $id . '">' . $modelo . '</option>';
                }
                ?>
              </select>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Fechar</button>
              <button type="submit" class="btn btn-outline-success" value="cadastrar">Salvar Mudanças</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery-3.7.1.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/dataTables.js"></script>
  <script src="js/dataTables.bootstrap5.js"></script>
  <script src="js/script.js"></script>

</body>

</html>