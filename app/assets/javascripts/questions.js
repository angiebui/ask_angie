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
      var id = $(self).data("voteable-id");
      var buttonType = $(self).attr('class');
      var image_type = $(self).data("image")
      var opposite_image_type = $(self).siblings('img').data('image')
      url = "/answers/{id}/{buttonType}".format({'id': id, 'buttonType' : buttonType });

      $.post(url, function(data) {
        $(self).siblings('.vote-number').html(data.answer_score);
        if (data.action_type === "create_vote")
          {$(self).attr('src', "/assets/selected_" + image_type);
          };
        if (data.action_type === "update_vote")
          { $(self).attr('src', "/assets/selected_" + image_type);
            $(self).siblings('img').attr("src", "/assets/" + opposite_image_type)}
      });

    });

});
