$(function() {

  // function ChatMember(user, id) {
  //   var member = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
  //                 <input name='group[user_ids][]' type='hidden' value='ユーザーのid'>
  //                 <p class='chat-group-user__name'>${user.name}</p>
  //                 <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
  //                 </div>`;
  // };
  function GroupMember(user, id){
    var user_list = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
  <input name='group[user_ids][]' type='hidden' value='${id}'>
  <p class='chat-group-user__name'>${user}</p>
  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
  </div>`;
    $("#chat-group-users").append(user_list);
  };

  var user_list = $("#user-search-result");

  function appendUser(user) {
    var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name}>追加</a>
                </div>`;
    user_list.append(html);
  }
  function appendNoUser(user) {
    var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name"></p>
                </div>`;
    user_list.append(html);
  }

  $(document).on("click", ".user-search-add", function() {
      $(this).parent().remove();
      var add_user = $(this).attr("data-user-name");
      var add_id = $(this).attr("data-user-id");
      GroupMember(add_user, add_id);
  });

  $(document).on("click", ".user-search-remove", function() {
      $(this).parent().remove();
  });


  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users){
      $('#user-search-result').empty();
      if (users.length !== 0) {
        users.forEach(function(user){
        appendUser(user);
      });
     }
     else {
       appendNoUser("一致するユーザーはいません");
     }
    })
    .fail(function() {
      alert("ユーザー検索に失敗しました");
    });
  });
});
