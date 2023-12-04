class UsersController < ApplicationController
  def index
    @groups = Group.all
    render 'groups/index'
  end

  def create
    user = User.new(user_params)
    user.name = params[:user][:name]

    if user.save
      sign_in(user)
      redirect_to root_path, notice: 'User successfully created!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
