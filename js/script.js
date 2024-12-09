// scripts.js

document.addEventListener('DOMContentLoaded', function() {
    // Carregar coordenadorias
    fetch('getCoord.php')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('fld-sigla_coord');

            data.forEach(coord => {
                const option = document.createElement('option');
                option.value = coord.id;
                option.textContent = coord.sigla_coord;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Erro ao buscar coordenadorias:', error));
    
    // Carregar setores
    fetch('getSetor.php')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('fld-nome_setor');
            data.forEach(setor => {
                const option = document.createElement('option');
                option.value = setor.id;
                option.textContent = setor.nome_setor;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Erro ao buscar setores:', error));

    // Carregar marcas
    fetch('getMarca.php')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('fld-marca');
            data.forEach(marca => {
                const option = document.createElement('option');
                option.value = marca.id;
                option.textContent = marca.marca;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Erro ao buscar marcas:', error));

    // Carregar modelos
    fetch('getModelo.php')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('fld-modelo');
            data.forEach(modelo => {
                const option = document.createElement('option');
                option.value = modelo.id;
                option.textContent = modelo.modelo;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Erro ao buscar modelos:', error));
});