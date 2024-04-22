/*document.addEventListener('DOMContentLoaded', function() {
  const filterElement = document.querySelector('main input');
  const cards = document.querySelectorAll('.cards li');

  filterElement.addEventListener('input', filterCards);

  function filterCards() {
      if (filterElement.value !== '') {
          for (let card of cards) {
              let title = card.querySelector('h2').textContent.toLowerCase();
              let filterText = filterElement.value.toLowerCase();
              if (!title.includes(filterText) ) {
                  card.style.display = "none";
              } else {
                  card.style.display = '';
              }
          }
      } else {
          for (let card of cards) {
              card.style.display = '';
          }
      }
  }
});/+

//inicio do filter checkbox
/*

document.addEventListener('DOMContentLoaded', function() {
    const filterInput = document.querySelector('#filter');
    const roupasCheckbox = document.querySelector('#roupaCheckbox');
    const alimentosCheckbox = document.querySelector('#alimentoCheckbox');
    const brinquedosCheckbox = document.querySelector('#brinquedoCheckbox');
    const monetariaCheckbox = document.querySelector('#monetariaCheckbox');
    const cards = document.querySelectorAll('.cards li');

    filterInput.addEventListener('input', filterCards);
    roupasCheckbox.addEventListener('change', filterCards);
    alimentosCheckbox.addEventListener('change', filterCards);
    brinquedosCheckbox.addEventListener('change', filterCards);
    monetariaCheckbox.addEventListener('change', filterCards);

    function filterCards() {
        const filterText = filterInput.value.toLowerCase();
        const roupasChecked = roupasCheckbox.checked;
        const alimentosChecked = alimentosCheckbox.checked;
        const brinquedosChecked = brinquedosCheckbox.checked;
        const monetariaChecked = monetariaCheckbox.checked;

        for (let card of cards) {
            const title = card.querySelector('h2').textContent.toLowerCase();
            const interests = card.dataset.interests.toLowerCase();

            const titleMatches = title.includes(filterText);
            const interestsMatch =
                (roupasChecked && interests.includes('roupa')) ||
                (alimentosChecked && interests.includes('alimento')) ||
                (brinquedosChecked && interests.includes('brinquedo')) ||
                (monetariaChecked && interests.includes('monetaria'));

            if (titleMatches && interestsMatch) {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        }
    }
});*/
//fim do filter checkbox

//inicio do filter select

document.addEventListener('DOMContentLoaded', function() {
    const filterInput = document.querySelector('#filter');
    const interestsSelect = document.querySelector('#interestsSelect');
    const interestsSelectCity = document.querySelector('#interestsSelect-city');

    const cards = document.querySelectorAll('.cards li');

    filterInput.addEventListener('input', filterCards);
    interestsSelect.addEventListener('change', filterCards);
    interestsSelectCity.addEventListener('change', filterCards);

    function filterCards() {
        const filterText = filterInput.value.toLowerCase();
        const selectedInterest = interestsSelect.value.toLowerCase();
        const selectedCity = interestsSelectCity.value.toLowerCase();

        for (let card of cards) {
            const title = card.querySelector('h2').textContent.toLowerCase();
            const interests = card.dataset.interests.toLowerCase();
            const city = card.dataset.city.toLowerCase();

            const titleMatches = title.includes(filterText);
            const interestsMatch = interests.includes(selectedInterest) || selectedInterest === '';
            const cityMatch = city === selectedCity || selectedCity === ''; // Verificar se a cidade do cartão é igual à cidade selecionada

            if (titleMatches && interestsMatch && cityMatch) {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        }
    }
});
