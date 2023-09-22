function validarCNPJ() {
    const cnpjInput = document.getElementById('cnpj');
    const cnpj = cnpjInput.value.replace(/[^\d]/g, '');

    if (cnpj.length !== 14) {
        alert('CNPJ inválido. O CNPJ deve conter 14 dígitos.');
        return;
    }

    const multiplicadores1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    const multiplicadores2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    let soma1 = 0;
    let soma2 = 0;

    for (let i = 0; i < 12; i++) {
        soma1 += parseInt(cnpj.charAt(i)) * multiplicadores1[i];
        soma2 += parseInt(cnpj.charAt(i)) * multiplicadores2[i];
    }

    const digito1 = (soma1 % 11 < 2) ? 0 : 11 - (soma1 % 11);
    const digito2 = (soma2 % 11 < 2) ? 0 : 11 - (soma2 % 11);

    if (parseInt(cnpj.charAt(12)) !== digito1 || parseInt(cnpj.charAt(13)) !== digito2) {
        alert('CNPJ inválido. Verifique os dígitos verificadores.');
    } else {
        alert('CNPJ válido.');
    }
}