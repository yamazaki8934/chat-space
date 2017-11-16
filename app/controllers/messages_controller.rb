class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    # @messages = Group.find(params[:group_id]).messages
    @message = Message.new
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    @group   = Group.find(params[:group_id])
    if @message.save
      redirect_to group_messages_path(@group)
    else
      render :index, notice: 'メッセージを入力してください'
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end
