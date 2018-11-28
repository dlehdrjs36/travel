$('#something').click(function() {
location.reload();
});

$(function() {
    var count = $('#rank li').length;
    var height = $('#rank li').height();

    function step(index) {
        $('#rank ol').delay(2000).animate({top: -height * index }, 500, function() {
            step((index + 1 ) % count);
        });
    }
    step(1);
});