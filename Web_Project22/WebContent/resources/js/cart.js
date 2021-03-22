$(document).ready(function() { 
	$('#favorite').on('click', function(e) 
{ var bookmarkURL = window.location.href; 
var bookmarkTitle = document.title; 
var triggerDefault = false; 
if (window.bar && window.bar.addPanel) { 
	window.bar.addPanel(bookmarkTitle, bookmarkURL, ''); 
	} else if ((window.bar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
var $this = $(this); 
$this.attr('href', bookmarkURL); 
$this.attr('title', bookmarkTitle); 
$this.attr('rel', 'bar'); 
$this.off(e); 
triggerDefault = true; } 
	else if (window.external && ('AddFavorite' in window.external)) { 
		window.external.AddFavorite(bookmarkURL, bookmarkTitle); } 
	else { 
			alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.'); } return triggerDefault; }); });
