const searchContainer = document.querySelector('.barradepesquisa');
const searchInput = document.querySelector('.search-input');
const searchButton = document.getElementById('searchButton');

searchButton.addEventListener('click', function () {
    toggleSearchBar();
});

searchInput.addEventListener('keyup', function (event) {
    if (event.key === 'Enter') {
        toggleSearchBar();
    }
});

function toggleSearchBar() {
    if (searchContainer.offsetWidth === 50) {
        searchContainer.style.width = '200px'; // Expandir a barra de pesquisa
        searchInput.style.width = '150px';
        searchInput.style.marginRight = '10px';
        searchInput.focus();
    } else {
        searchContainer.style.width = '50px'; // Minimizar a barra de pesquisa
        searchInput.style.width = '0';
        searchInput.style.marginRight = '0';
    }
}
