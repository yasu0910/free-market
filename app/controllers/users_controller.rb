class UsersController < ApplicationController
  def show
    if user_signed_in? 
      @user = User.find(params[:id])
      if not current_user.id == @user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end