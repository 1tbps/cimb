new DataTable('#listar-cpus', {
    ajax: 'listar_cpus.php',
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/pt-BR.json'
    },
    responsive: true,

    columnDefs: [
        { orderable: false, targets: -1 },
        { responsivePriority: 1, targets: -1 },
        { responsivePriority: 2, targets: 1 },
        { responsivePriority: 3, targets: 3 },
        { responsivePriority: 4, targets: 5 },
        { responsivePriority: 5, targets: 2 },
        { responsivePriority: 6, targets: 4 },
        { responsivePriority: 7, targets: 0 }
    ],
    processing: true,
    serverSide: true
});

const formCadCPU = document.getElementById("form-cad-comp");
const fecharModalCad = new bootstrap.Modal(document.getElementById("cadastro-cpu-modal"));

if (formCadCPU) {
    formCadCPU.addEventListener("submit", async (e) => {
        e.preventDefault();
        const dadosForm = new FormData(formCadCPU);

        const dados = await fetch("cadastrar.php", {
            method: "POST",
            body: dadosForm
        });
        const resposta = await dados.json();

        if (resposta['status']) {
            document.getElementById('msgAlertErroCad').innerHTML = "";
            document.getElementById('msgAlerta').innerHTML = resposta['msg'];
            formCadCPU.reset();
            fecharModalCad.hide();
            listarDataTables = $('#listar-cpus').DataTable();
            listarDataTables.draw();
        } else {
            document.getElementById('msgAlertErroCad').innerHTML = resposta['msg'];
        }

    });
}

async function exiCPU(id) {
    // console.log("Acessou: " + id);
    const dados = await fetch('exibir.php?id=' + id);
    const resposta = await dados.json();
    // console.log(resposta);

    if (resposta['status']) {
        const formExiCPU = new bootstrap.Modal(document.getElementById("exibir-cpu-modal"));
        formExiCPU.show();
        document.getElementById("msgAlerta").innerHTML = "";
        document.getElementById("idCPU").innerHTML = resposta['dados'].id;
        document.getElementById("nomeCPU").innerHTML = resposta['dados'].nome_cpu;
        document.getElementById("ultimoCPU").innerHTML = resposta['dados'].ult_usuario;
        document.getElementById("patrimonioCPU").innerHTML = resposta['dados'].patrimonio_cpu;
        document.getElementById("servicetagCPU").innerHTML = resposta['dados'].servicetag_cpu;
        document.getElementById("emailofficeCPU").innerHTML = resposta['dados'].office_email;
        document.getElementById("senhaofficeCPU").innerHTML = resposta['dados'].office_senha;
        document.getElementById("serialofficeCPU").innerHTML = resposta['dados'].office_serial;
        document.getElementById("coordCPU").innerHTML = resposta['dados'].sigla_coord;
        document.getElementById("setorCPU").innerHTML = resposta['dados'].sigla_setor;
        document.getElementById("marcaCPU").innerHTML = resposta['dados'].marca;
        document.getElementById("modeloCPU").innerHTML = resposta['dados'].modelo;
    } else {
        document.getElementById("msgAlerta").innerHTML = resposta['msg'];
    }
}

const ediCPUModal = new bootstrap.Modal(document.getElementById("editar-cpu-modal"));
async function ediCPU(id) {
    // console.log("Editou: " + id);
    const dados = await fetch('exibir.php?id=' + id);
    const resposta = await dados.json();
    // console.log(resposta['dados']);
    if (resposta['status']) {
        document.getElementById("msgAlertErroEdi").innerHTML = "";

        document.getElementById("msgAlerta").innerHTML = "";
        ediCPUModal.show();

        document.getElementById("fld-ediid").value = resposta['dados'].id;
        document.getElementById("fld-edinome_cpu").value = resposta['dados'].nome_cpu;
        document.getElementById("fld-ediult_usuario").value = resposta['dados'].ult_usuario;
        document.getElementById("fld-edipatrimonio_cpu").value = resposta['dados'].patrimonio_cpu;
        document.getElementById("fld-ediservicetag_cpu").value = resposta['dados'].servicetag_cpu;
        document.getElementById("fld-edioffice_email").value = resposta['dados'].office_email;
        document.getElementById("fld-edioffice_senha").value = resposta['dados'].office_senha;
        document.getElementById("fld-edioffice_serial").value = resposta['dados'].office_serial;
        document.getElementById("fld-edisigla_coord").value = resposta['dados'].coord_id;
        document.getElementById("fld-edinome_setor").value = resposta['dados'].setor_id;
        document.getElementById("fld-edimarca").value = resposta['dados'].marca_id;
        document.getElementById("fld-edimodelo").value = resposta['dados'].modelo_id;
    } else {
        document.getElementById("msgAlerta").innerHTML = resposta['msg'];
    }
}


const formEdiCPU = document.getElementById("form-edi-comp");
if (formEdiCPU) {
    formEdiCPU.addEventListener("submit", async (e) => {
        e.preventDefault();
        const dadosForm = new FormData(formEdiCPU);

        const dados = await fetch("editar.php", {
            method: "POST",
            body: dadosForm
        });

        const resposta = await dados.json();

        if (resposta['status']) {
            // Manter a janela modal aberta
            // document.getElementById("msgAlertErroEdi").innerHTML = resposta['msg'];

            // Fechar a janela modal
            document.getElementById("msgAlerta").innerHTML = resposta['msg'];
            document.getElementById("msgAlertErroEdi").innerHTML = "";

            // limpar o formulário
            formEdiCPU.reset();
            ediCPUModal.hide();

            // Atualizar a lista de registros
            listarDataTables = $('#listar-cpus').DataTable();
            listarDataTables.draw();

        } else {
            document.getElementById("msgAlertErroEdi").innerHTML = resposta['msg'];
        }
    });
}
async function excCPU(id) {
    // console.log("Deletará: " + id);
    var confirmar = confirm("Tem certeza que deseja excluir o registro selecionado?");
    if (confirmar) {
        const dados = await fetch("excluir.php?id=" + id);
        const resposta = await dados.json();
        // console.log(resposta);
        if (resposta['status']) {
            document.getElementById("msgAlerta").innerHTML = resposta['msg'];
            // Atualizar a lista de registros
            listarDataTables = $('#listar-cpus').DataTable();
            listarDataTables.draw();
        } else {
            document.getElementById("msgAlerta").innerHTML = resposta['msg'];

        }
    }
}