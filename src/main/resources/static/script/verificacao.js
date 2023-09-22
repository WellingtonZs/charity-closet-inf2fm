function exibirFormSenha() {
    document.getElementById("formSenha").style.display = "block";
}

// Função para verificar o código de verificação
function verificarCodigo() {
    var codigoInserido = document.getElementById("codigo").value;
    var codigoCorreto = '444555';

    if (codigoInserido === codigoCorreto) {
         // Exibir o formulário de nova senha
        exibirFormSenha();
    } else {
        alert("Código de verificação incorreto. Por favor, tente novamente.");
    }
}
