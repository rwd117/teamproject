$(function(){
    var $menu=$('.gnb ul li'),
    $contents=$('.main section');

    $menu.click(function(e){
        e.prventDefault();

        var idx=$(this).index();
        var section=$contents.eq(idx);
        console.log(idx);
        var sectionDistance=section.offset().top;

        $('html, body').stop().animate({scrollTop : sectionDistance},500);

    });

    $(window).scroll(function(){
        $contents.each(function(){
            if($(this).offset().top <= $(window).scrollTop()) {
                var idx=$(this).index();
                $menu.removeClass('active');
                $menu.eq(idx).addClass('active');
            }
        });
    });
});