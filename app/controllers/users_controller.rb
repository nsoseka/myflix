class UsersController < ApplicationController
  def new
    redirect_to home_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account was succesfully created..."
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:password, :full_name, :email)
  end
end
