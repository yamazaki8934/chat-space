json.id @message.id
json.body  @message.body
json.image  @message.image.url
json.name @message.user.name
json.time @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
