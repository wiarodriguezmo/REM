var actual;
function paginar(pag)
{
    // Desmarcar número de página visualizada previamente.
    $('#num_pag_' + actual).addClass('btn-default');

    // Determinar la página a visualizar.
    if(pag === '+' && actual < paginas) actual += 1;
    else if(pag === '-' && actual > 1) actual -= 1;
    else if(pag !== '+' && pag !== '-') actual = pag;

    // Mostrar la página actual.
    $('.pag').hide();
    if(1 < actual) $('#anterior').prop("disabled", false);
    if(actual < paginas) $('#siguiente').prop("disabled", false);
    $('.pagina_' + actual).show();
    $('#num_pag_' + actual).removeClass('btn-default');
}