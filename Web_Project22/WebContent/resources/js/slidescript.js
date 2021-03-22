$(function(){
    var $slideShow =$('.slideShow'),
        $slideGroup=$slideShow.find('.slideArea'),
        $slides=$slideGroup.find('.slide'),
        $nav=$slideShow.find('.slideNav'),
        $indicator=$slideShow.find('.slideIndicator'),
        
        indicatorHTML='',
        slideCount=$slides.length,
        curIndex=0,
        timer;

        //슬라이드 이미지 요소 배치 및 인디게이터 생성
        $slides.each(function(i){
            $(this).css({
                left: i*100+'%'
            })
            indicatorHTML += '<a href="#">'+(i+1)+'</a>'
        });
    //인디게이터 삽입
    $indicator.html(indicatorHTML);

    //슬라이드 이동함수
    function goToSlide(index) {
        $slideGroup.animate({
            left: -100*index + '%' },4000);
        curIndex=index;

        updateNav();
    }
 
//  슬라이드 상태에 따라 왼쪽,오른쪽 버튼표시와 인디게이터 표시
    function updateNav(){
        var $navPre=$nav.find('.prev'),
            $navNext=$nav.find('.next');

    //만약 첫번째 슬라이드일 경우 prev이미지 표시 안되도록
        if(curIndex===0) {
            $navPre.addClass('disabled');
        } else {
            $navPre.removeClass('disabled');
        }
    //만약 마지막 슬라이드일 경우 next이미지 표시 안되도록
        if(curIndex===(slideCount-1)) {
            $navNext.addClass('disabled');
        } else {
            $navNext.removeClass('disabled');
        }


        // 인디게이터에서 현재슬라이드만 검정색 표시
        $indicator.find('a').removeClass('active').eq(curIndex).addClass('active');
    }
 

    //좌우버튼으로 슬라이드 이동
    $nav.find('.prev').click(function(e){
        e.preventDefault;    //
        goToSlide(curIndex-1);
    });

    $nav.find('.next').click(function(e){
        e.preventDefault;    //
        goToSlide(curIndex+1);
    });

   

    //인디게이터로 클릭시 해당슬라이드 이동
    $indicator.find('a').click(function(e){
        e.preventDefault;
        goToSlide($(this).index());
    });


     //첫번째 슬라이드 표시
     goToSlide(curIndex);
   


    function startTimer(){
        timer=setInterval(function(){
            var nextIndex = (curIndex+1)%slideCount;
            goToSlide(nextIndex);
        },3000);
    }
    startTimer();
    
    function stopTimer(){
        clearInterval(timer);
    }
    $slideShow.mouseenter(function(){
        stopTimer();

    })
    .mouseleave(function(){
        startTimer();
    });

    
});
