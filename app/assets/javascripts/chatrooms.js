$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}

$(function(){
  $("#addClass").click(function () {
    $('#qnimate').addClass('popup-box-on');
    $("#scroll").scrollTop($("#scroll")[0].scrollHeight);
  });

  $("#removeClass").click(function () {
    $('#qnimate').removeClass('popup-box-on');
  });
})
