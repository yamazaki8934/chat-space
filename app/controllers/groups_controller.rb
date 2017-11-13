class GroupsController < ApplicationController
  before_action :group_info, only: [:edit]

  def index
  end

  def edit
  end

  def new
    @group = Group.new
    # if @group.new(group_params)
    #   redirect_to root_path, notice: 'グループを作成しました'
    # else
    # end
  end

  def update
  end

  def create
    @group = Group.new(name: group_params[:name])
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render "new"
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, :user_ids)
    end

    def group_info
      @group = Group.find(params[:id])
    end
end
