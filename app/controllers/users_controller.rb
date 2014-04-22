class UsersController < ApplicationController
  
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save 
      flash[:success] = "Create Successful!"
      redirect_to @user
    else
      flash[:faild] = "fail"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :birthday, :email, :role, :password, :password_confirmation)
    end

end
