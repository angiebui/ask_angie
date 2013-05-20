$(document).ready(function() {
 $('form').on('ajax:success', function(){
   $(this).closest('span').children('p').css('background-color', 'whitesmoke')
   $(this).closest('span').fadeOut('slow');
 })
});
