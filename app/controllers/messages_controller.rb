class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
  end

  def create

    @message = Message.new(message_params)
    @group   = Group.find(params[:group_id])
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group)  }
        format.json
      end
    else
      flash.now[:notice] = "メッセージを入力してください。"
      render :index
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end
