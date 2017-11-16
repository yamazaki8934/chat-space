class MessagesController < ApplicationController

  def index
    @message = Group.find(params[:group_id]).message
  end

  def new
  end

  def create

    @message = Message.new(message_params)
    if @message.save(text: params[:text])
      redirect_to root_path
    else
      redirect_to root_path, notice: 'メッセージを入力してください'
    end
  end

  private
    def message_params
      params.require(:message).permit(:text)
    end
end
