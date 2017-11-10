class UsersController < ApplicationController
  before_action :user_info, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'アカウントが更新されました'
    else
      redirect_to edit_user_path(params[:id]), notice: '更新に失敗しました'
    end
  end

  private
   def user_params
    params.require(:user).permit(:name, :email)
   end

   def user_info
    @user = User.find(params[:id])
   end
end
