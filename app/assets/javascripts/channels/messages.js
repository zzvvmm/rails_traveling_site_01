App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    $("#scroll").animate({ scrollTop: $("#scroll")[0].scrollHeight}, 1000);
    return "<div class='direct-chat-msg doted-border'><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>" + data.user + "</span></div><div class='direct-chat-text'>" + data.message + "</div><div class='direct-chat-info clearfix'><span class='direct-chat-timestamp pull-right'></span></div></div>";
  }
});
