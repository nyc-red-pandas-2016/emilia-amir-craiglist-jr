class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  # def show
  #   @user = User.find(user_params)
  #   render plain: @user
  # end

  def login
    @user = User.new
  end

  def loggedin
    user = User.find_by(name: params[:user][:name])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'login'
    end

  end

  def logout
    session.clear
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
