class UsersController < ApplicationController
  def edit
    @user = User.find(current_user.id) 
  end
end
