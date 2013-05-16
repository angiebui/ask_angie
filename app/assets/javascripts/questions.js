String.prototype.format = function (o) {
    return this.replace(/{([^{}]*)}/g,
        function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
        }
    );
};

// $(document).ready(function() {
//   $('.upvote').on('click', function(e){
//     e.preventDefault();
//     var id = $(this).data("answer-id")
//     $.post("/answers/{id}/upvote".format({'id': id}));
//   });

//   $('.downvote').on('click', function(e){
//     e.preventDefault();
//     var id = $(this).data("answer-id")
//     $.post("/answers/{id}/downvote".format({'id': id}));

//   });


$(document).ready(function() {

    $('.answers').on('click', 'img', function(e){
      e.preventDefault();
      var id = $(this).data("answer-id");
      var buttonType = $(this).attr('class');
      
      $.post("/answers/{id}/{buttonType}".format({'id': id, 'buttonType' : buttonType }));


    });

  

});
