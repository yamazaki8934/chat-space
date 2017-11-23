$(function(){
  function buildHTML(message){
    var insertimage = '';
    if (message.image) {
      insertimage = `<img src="${message.image}">`;
    }
    var html =  ` <div class='contents__content'>
                <span class='contents__content__members-name'>${message.name}</span>
                <span class='contents__content__time1'>${message.time}</span>
                  <div class='contents__content__message'>
                    ${message.body}
                    <div class='contents__content__message__image'>${insertimage}</div>
                    </div>
                  </div>
                </div>`;
    return html;
  }
  $('#new_message').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
          var html = buildHTML(data);
          $('.contents').append(html);
          $('.contents').animate({scrollTop: $('.contents')[0].scrollHeight}, 'fast');
          $('.chat-group-form__input').val('');
          $('.btn').prop('disabled', false);
      })
      .fail(function(){
        alert('メッセージを入力してください。');
      });
  });
});
