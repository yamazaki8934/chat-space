class UsersController < ApplicationController
  before_action :user_info, only: [:index, :edit, :update]

  def index
    @users = User.search_users(params[:keyword])
    # respond_to do |format|
    #   format.html { redierct_to :root }
    # end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'アカウントが更新されました'
    else
      flash.now[:notice] = '更新に失敗しました'
      render :edit
    end
  end

  private
   def user_params
    params.require(:user).permit(:name, :email)
   end

   def user_info
    @user = User.find_by(params[:id])
   end
end
