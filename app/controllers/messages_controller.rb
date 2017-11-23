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
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group)  }
        format.json
      end
    else
      flash.now[:notice] = "メッセージを入力してください。"
      render :index
    end
    # if @message.save
    #   redirect_to group_messages_path(@group)
    # else
    #   flash.now[:notice] = "メッセージを入力してください。"
    #   render :index
    # end
  end

  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end
