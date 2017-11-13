class GroupsController < ApplicationController
  before_action :group_info, only: [:edit]

  def index
  end

  def edit
  end

  def new
    @group = Group.new
  end

  def update
  end

  def create
    binding.pry
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render "new"
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end

    def group_info
      @group = Group.find(params[:id])
    end
end
