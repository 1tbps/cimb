new DataTable('#listar-computadores', {
  ajax: 'listar_computadores.php',
  language: {
    url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/pt-BR.json'
  },
  processing: true,
  serverSide: true
});
const formNewComp = document.getElementById("form-cad-comp");
const fecharModalCad = new bootstrap.Modal(document.getElementById("cadastro-comp-modal"));
if (formNewComp) {
  formNewComp.addEventListener("submit", async (e) => {
    e.preventDefault();
    const dadosForm = new FormData(formNewComp);

    const dados = await fetch("cadastrar.php", {
      method: "POST",
      body: dadosForm
    });
    const resposta = await dados.json();

    if (resposta['status']) {
      document.getElementById('msgAlertErroCad').innerHTML = "";
      document.getElementById('msgAlerta').innerHTML = resposta['msg'];
      formNewComp.reset();
      fecharModalCad.hide();
      listarDataTables = $('#listar-computadores').DataTable();
      listarDataTables.draw();
    } else {
      document.getElementById('msgAlertErroCad').innerHTML = resposta['msg'];
    }

  });
}
