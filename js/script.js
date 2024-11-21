new DataTable('#listar-computadores', {
  ajax: 'listar_computadores.php',
  language: {
    url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/pt-BR.json'
  },
  processing: true,
  serverSide: true
});
const formNewComp = document.getElementById("form-cad-comp");
if (formNewComp) {
  formNewComp.addEventListener("submit", async (e) => {
    e.preventDefault();
    const dadosForm = new FormData(formNewComp);

    const dados = await fetch("cadastrar.php", {
      method: "POST",
      body: dadosForm
    });

    const resposta = await dados.json();
    console.log(resposta);
    if (resposta['status']) {

    } else {
      document.getElementById('msgAlertErroCad').innerHTML = resposta['msg'];
    }

  });
}
