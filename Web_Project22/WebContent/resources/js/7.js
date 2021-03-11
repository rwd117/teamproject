$(function(){
    var $tabBtn=$('.tabArea .tabBtn');
    var $tabCon=$('.tabArea .tabCon');
    $tabBtn.click(function(e){
        e.preventDefault(); //기본동작을 취소
        $tabBtn.removeClass('on');
        $(this).addClass('on');
        $tabCon.hide();
        $(this).next('.tabCon').show();
    });
});
       

