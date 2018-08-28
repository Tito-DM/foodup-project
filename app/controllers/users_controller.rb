class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_user, except: [:new,:create]
    before_action :require_same_user, only: [:edit,:update,:show,:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #allow to login when registered
      flash[:notice] = 'Profile was successfully created'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Your account was updated successfully'
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone)
  end

   def require_same_user
    if current_user != @user
      flash[:denger] = 'you can only acess your account'
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end




end