String.prototype.format = function (o) {
  return this.replace(/{([^{}]*)}/g,
    function (a, b) {
      var r = o[b];
      return typeof r === 'string' || typeof r === 'number' ? r : a;
    }
    );
};


$(document).ready(function() {

  $('.question-arrows').on('click', 'img', function(e){
    e.preventDefault();
    var self = this;
    var id = $(self).data("voteable-id");
    var buttonType = $(self).attr('class');
    console.log(buttonType);
    url = "/questions/{id}/{buttonType}".format({'id': id, 'buttonType' : buttonType });

    $.post(url, function(data) {
      if (data.error) {
        $('.question-errors').text(data.error);
        $('.question-arrows').unbind('click');
      }

        $(self).siblings('.vote-number').html(data.answer_score);
        var oppositeImage = $(self).siblings('img');
        oppositeImage.attr('src', oppositeImage.attr('src').replace('selected_', '')) 
        var imageSource = $(self).attr('src').split('/')
        if ($(self).attr('src').indexOf("selected") === -1)
        {imageSource.shift();
         imageSource[1] = 'selected_'+imageSource[1]
         $(self).attr('src', '/'+imageSource.join('/'))};     
      
      });
  
  });

});
