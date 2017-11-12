class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:id])
  end

  def new
  end

end
