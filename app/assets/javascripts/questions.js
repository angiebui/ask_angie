String.prototype.format = function (o) {
    return this.replace(/{([^{}]*)}/g,
        function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
        }
    );
};


$(document).ready(function() {

    $('.answers').on('click', 'img', function(e){
      e.preventDefault();
      var self = this;
      var id = $(self).data("answer-id");
      var buttonType = $(self).attr('class');
      var image_type = $(self).data("image")
      url = "/answers/{id}/{buttonType}".format({'id': id, 'buttonType' : buttonType });

      $.post(url, function(data) {
        $(self).siblings('.vote-number').html(data.answer_score);
        $(self).attr('src', "/assets/selected_" + image_type);
      });

    });

});
