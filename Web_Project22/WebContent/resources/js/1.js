$(function(){
    var win=$(window);
    var innerTop=$('header').offset().top;
   win .scroll(function(){
       if(win .scrollTop() > innerTop){
           $('.inner').addClass('sticky');
       } else{
           $('.inner').removeClass('sticky');
       }
  
});


});
$(function(){
    $('.btn1').click(function(){
        $('#aside').toggleClass('open');
        if($('#aside').hasClass('open')){
            $('#aside').stop().animate({left:0},500);
            $('.btn1').find('img').attr({'src':'../img/menu11.png'});
        }
        else{
            $('#aside').stop().animate({left:'-400px'},500);
            $('.btn1').find('img').attr({'src':'../img/menu11.png'});
}
        
    });
});

$(function(){
    $('.mainMenu').mouseenter(function(){
      $('header').stop().animate({height:'350px'},1000);
    }).mouseleave(function(){
      $('header').stop().animate({height:'150px'},1000);
    });
});


$(function(){
    $(window).scroll(function(){
        var posTop=$(this).scrollTop();
        $('aside').stop().animate({top: posTop+80});
    });
});
$(function(){
    $(window).scroll(function(){
        var posTop=$(this).scrollTop();
        $('.right').stop().animate({top: posTop+400});
    });
});
