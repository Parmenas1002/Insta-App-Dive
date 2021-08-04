class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show,:edit,:update]
   def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to new_session_path, notice: "Welcome #{@user.name}"
    else  
        render :new
    end
  end
  def show
    if current_user.id != @user.id
        render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end
  def edit
  end
  def update
    if @user.update(user_params)
        redirect_to user_path, notice: "Update informations with success"
    else
        render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
