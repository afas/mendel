$(document).ready(function() {
    $('#q-login, #q-pass, #q-search, #q-filter').placeholder();

    $('#top-menu li a.top-menu-item').hover(function() {
        $(this).parents('li').toggleClass('hover');
        $(this).parents('li').children('.sub-top-menu').css('min-width', $(this).width() + 13 + "px");
    });

    $('#top-menu li .sub-top-menu').hover(function() {
        $(this).parents('li').toggleClass('hover');
    });

    $('.b-look .b-look-map .look-map-items li i.dig').hover(function() {
        $(this).next('.look-map-item-view').toggle();
    })
});
