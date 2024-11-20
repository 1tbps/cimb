<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" href="img/favicon-96x96.png" sizes="96x96" />
  <link rel="icon" type="image/svg+xml" href="img/favicon.svg" />
  <link rel="shortcut icon" href="img/favicon.ico" />
  <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png" />
  <link rel="manifest" href="img/site.webmanifest" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CIMB</title>
  <link rel="stylesheet" href="css/style.css">
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css">
</head>

<body>
  <div class="container">
    <div class="d-flex justify-content-between align-items-center pt-3">
      <h1 class="display-6">CIMB</h1>
      <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#cadastro-comp-modal">Inserir Registros</button>
    </div>
    <hr class="pb-2">
    <table id="listar-computadores" class="table table-striped table-hover display" style="width:100%">
      <thead>
        <tr>
          <th>ID</th>
          <th>NOME PC</th>
          <th>ÚLTIMO USUÁRIO</th>
          <th>COORD.</th>
          <th>SETOR</th>
          <th>MARCA</th>
          <th>MODELO</th>
          <!-- <th>Ações</th> -->
        </tr>
      </thead>
    </table>
  </div>

  <div class="modal fade" id="cadastro-comp-modal" tabindex="-1" aria-labelledby="cad-comp-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="cad-comp-modal-label">Inserir Registros</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form class="row g-3" method="POST" id="form-cad-comp">
            <div class="col-md-6">
              <label for="fld-nome-cpu" class="form-label">Nome PC</label>
              <input type="text" name="fld-nome-cpu" class="form-control" id="fld-nome-cpu" placeholder="Nome Completo">
            </div>
            <div class="col-md-6">
              <label for="fld-ult-usuario" class="form-label">Último Usuário</label>
              <input type="text" name="fld-ult-usuario" class="form-control" id="fld-ult-usuario" placeholder="Primeiro Nome">
            </div>
            <!-- <div class="col-md-3">
              <label for="fld-sigla-setor" class="form-label">Coord.</label>
              <input type="text" name="fld-sigla-setor" class="form-control" id="fld-sigla-setor" placeholder="Sigla do setor">
            </div> -->

            <div class="col-md-3">
              <label for="fld-sigla-setor" class="form-label">Coord.</label>
              <select name="fld-sigla-setor" id="fld-sigla-setor" class="form-select">
                <option value="">Selecione a Coord.</option>
                <?php
                include_once "conexao.php";

                $query_setor = 'SELECT ID, sigla_setor FROM Setores';
                $result_setor = $conn->prepare($query_setor);
                $result_setor->execute();

                while ($row_setor = $result_setor->fetch(PDO::FETCH_ASSOC)) {
                  extract($row_setor);
                  echo '<option value="' . $ID . '">' . $sigla_setor . '</option>';
                }

                ?>
              </select>
            </div>
            <div class="col-md-9">
              <label for="fld-nome-setor" class="form-label">Setor</label>
              <select name="fld-nome-setor" id="fld-nome-setor" class="form-select">
                <option value="">Selecione o Setor</option>
                <?php
                include_once "conexao.php";

                $query_setor = 'SELECT ID, nome_setor FROM Setores';
                $result_setor = $conn->prepare($query_setor);
                $result_setor->execute();

                while ($row_setor = $result_setor->fetch(PDO::FETCH_ASSOC)) {
                  extract($row_setor);
                  echo '<option value="' . $ID . '">' . $nome_setor . '</option>';
                }

                ?>
              </select>
            </div>
            <div class="col-md-6">
              <label for="fld-marca" class="form-label">Marca</label>
              <select name="fld-marca" id="fld-marca" class="form-select">
                <option value="">Selecione a Marca</option>
                <option value="DELL">DELL</option>
                <option value="HP">HP</option>
              </select>
            </div>
            <div class="col-md-6">
              <label for="fld-modelo" class="form-label">Modelo</label>
              <select name="fld-modelo" id="fld-modelo" class="form-select">
                <option value="">Selecione o Modelo</option>
                <option value="OPTIPLEX 3070">OPTIPLEX 3070</option>
                <option value="ELITEDESK 800 G4 DM">ELITEDESK 800 G4 DM</option>
              </select>
            </div>
            <!-- <div class="col-12">
              <button type="submit" class="btn btn-primary">Sign in</button>
            </div> -->
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-secondary " data-bs-dismiss="modal">Fechar</button>
              <button type="submit" class="btn btn-outline-success ">Salvar Mudanças</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
  <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js"></script>
  <script src="js/script.js"></script>

</body>

</html>