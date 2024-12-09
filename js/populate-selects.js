// Arquivo: populate-selects.js

function populateSelect(url, selectId, placeholder = 'Selecione') {
  fetch(url)
    .then(response => response.json())
    .then(data => {
      const select = document.getElementById(selectId);
      select.innerHTML = `<option value="">${placeholder}</option>`; 
      data.forEach(item => {
        const option = document.createElement('option');
        option.value = item.id;
        option.textContent = item.nome_setor || item.sigla_coord || item.marca || item.modelo; 
        select.appendChild(option);
      });
    })
    .catch(error => console.error(`Erro ao buscar ${selectId}:`, error));
}

// Chamadas para popular os selects
document.addEventListener('DOMContentLoaded', () => {
  populateSelect('getCoord.php', 'fld-edisigla_coord', 'Selecione a Coord.');
  populateSelect('getSetor.php', 'fld-edinome_setor', 'Selecione o Setor.');
  populateSelect('getMarca.php', 'fld-edimarca', 'Selecione a Marca.');
  populateSelect('getModelo.php', 'fld-edimodelo', 'Selecione o Modelo.');
  populateSelect('getCoord.php', 'fld-sigla_coord', 'Selecione a Coord.');
  populateSelect('getSetor.php', 'fld-nome_setor', 'Selecione o Setor.');
  populateSelect('getMarca.php', 'fld-marca', 'Selecione a Marca.');
  populateSelect('getModelo.php', 'fld-modelo', 'Selecione o Modelo.');
});