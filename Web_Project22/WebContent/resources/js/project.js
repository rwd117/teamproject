
 $(function(){
    $('#wrap ul').css({
        width: $('#wrap ul li').length*900
    });
        
    $('#wrap ul').prepend($('#wrap ul li:last')).css({
        marginLeft:-900
    });
    


자동슬라이드
setInterval(function(){$('#wrap ul li').click();},2000);
});