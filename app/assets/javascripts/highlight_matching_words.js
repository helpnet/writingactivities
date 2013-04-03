$(document).ready(function() {

    $('.paragraph a').click(function() {
        return false;
    });

    $('.paragraph a').each(function() {
        var id = $(this).attr('class');

        $(this).hover(function() {
            $('a.' + id).addClass('highlighted');
        },
        function() {
            $('a.' + id).removeClass('highlighted');
        });

    });

});
