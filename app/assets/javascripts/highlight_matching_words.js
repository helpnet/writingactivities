$(document).ready(function() {

    $('.paragraph a').click(function() {
        return false;
    });

    $('.paragraph a').each(function() {
        var id = $(this).attr('class');

        $(this).hover(function() {
            var klass = $(this).parent().attr('class');
            $('.' + klass + ' a.' + id).addClass('highlighted');
        },
        function() {
            var klass = $(this).parent().attr('class');
            $('.' + klass + ' a.' + id).removeClass('highlighted');
        });

    });

});
