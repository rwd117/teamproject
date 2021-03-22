
$(function(){
    $(window).scroll(function(){
        var posTop=$(this).scrollTop();
        console.log(posTop);
        $('aside').stop().animate({top: posTop+200});
    });
});

// $(function(){
//     $(window).scroll(function(){
//         var headerTop=$(this).scrollTop();
//         console.log(headerTop);
//         $('header').stop().animate({top: headerTop});
//     });
// });

// $(function()
//     $(window).scroll(function(){
//         var headerTop=$(this).scrollTop();
//         if(win .scrollTop() > headerTop){
//             $('header').addClass('sticky');
//         } else{
//             $('header').removeClass('sticky');
//         }
//     });
// });

// $(function(){
//     var win=$(window);
//     var headerTop=$('header').offset().top;
//    win .scroll(function(){
//        if(win .scrollTop() > headerTop){
//            $('header').addClass('sticky');
//        } else{
//            $('header').removeClass('sticky');
//        }
  
// });
// });

      $(function(){
          $('.mainMenu').mouseenter(function(){
            $('header').stop().animate({height:'370px'},500);
          }).mouseleave(function(){
            $('header').stop().animate({height:'148px'},500);
          });
      });
      $(function(){
            $('button').click(function(){
                $('aside').toggleClass('open');
                if($('aside').hasClass('open')){
                    $('aside').stop().animate({left:0},500);
                    $('button').find('img').attr({'src':'img/menu.png'});
                }
                else{
                    $('aside').stop().animate({left:'-250px'},500);
                    $('button').find('img').attr({'src':'img/menu.png'});
        }
                
            });
        });
 