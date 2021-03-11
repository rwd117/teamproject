$(function(){
    $('#top ul').css({
        width: $('#top ul li').length*350
    });
        
    $('#top ul').prepend($('#top ul li:last')).css({
        marginLeft:-350
    },5000);
    //이전버튼 클릭시
    $('.pre').click(function(){
        $('#top ul').animate({marginLeft:0},function(){
            $('#top ul').prepend($('#top ul li:last')).css({ marginLeft:-350});
    });
});
    //다음버튼 클릭시
    $('.nex').click(function(){
        $('#top ul').animate({marginLeft:-700},function(){
            $('#top ul').append($('#top ul li:first')).css({ marginLeft:-350});
    });
    });
    setInterval(function(){$('.nex').click();},4000);
});