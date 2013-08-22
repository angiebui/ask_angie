String.prototype.format = function (o) {
    return this.replace(/{([^{}]*)}/g,
        function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
        }
    );
};

// REVIEW: use objects, push yourself in that direction
$(document).ready(function() {

    $('.answers').on('click', 'img', function(e){
      e.preventDefault();
      // REVIEW: why not do var self = $(self) and avoid initializing a new jquery object.
      var self = this;
      var id = $(self).data("voteable-id");
      var buttonType = $(self).attr('class');
      var imageType = $(self).data("image")
      var oppositeImageType = $(self).siblings('img').data('image')
      // REVIEW: please use var url
      url = "/answers/{id}/{buttonType}".format({'id': id, 'buttonType' : buttonType });

      $.post(url, function(data) {
        if (data.error) {
          $('.error-container').text(data.error);
          // REVIEW: why are you unbinding the click?
          $('.answers').unbind('click');
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
