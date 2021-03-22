$(function(){
    $('#top ul').css({
        width: $('#top ul li').length*350
    },5000);
        
    $('#top ul').prepend($('#top ul li:last')).css({
        marginLeft:-350
    },6000);
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
    setInterval(function(){$('.nex').click();},6000);
});

$(function(){
    $('.up1').click(function(){
        $('right-sidebar').toggleClass('open');
        if($('right-sidebar').hasClass('open')){
            $('right-sidebar').stop().animate({right:0},500,'easeInQuad');
            $('.up1').find('img').attr({'src':'../img/up1.png'});
        }
        else{
            $('right-sidebar').stop().animate({right:'-100px'},500);
            $('.up1').find('img').attr({'src':'../img/up1.png'});
}
        
    });
});