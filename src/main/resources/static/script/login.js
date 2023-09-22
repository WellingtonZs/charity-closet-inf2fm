const senhaInput = document.getElementById('senha');
const mostrarSenhaButton = document.getElementById('mostrarSenha');

mostrarSenhaButton.addEventListener('click', function () {
    if (senhaInput.type === 'password') {
        senhaInput.type = 'text';
        mostrarSenhaButton.textContent = 'Ocultar Senha';
    } else {
        senhaInput.type = 'password';
        mostrarSenhaButton.textContent = 'Mostrar Senha';
    }
});

function redirecionar(){
document.getElementById('redirecionar').addEventListener('click', function() {
    window.location.href = 'cadastroong.html';
});
}

function redirecionarlogin(){
    document.getElementById('botao-form').addEventListener('click', function() {
        window.location.href = 'homepage.html';
    });
    }