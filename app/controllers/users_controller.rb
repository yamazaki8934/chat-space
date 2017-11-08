class UsersController < ApplicationController
  before_action :user_info

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      edit_user_path(current_user.id)
    end
  end

  def show
  end

  private
   def user_params
    params.require(:user).permit(:name, :email)
   end

   def user_info
    @user = User.find(params[:id])
   end
end
