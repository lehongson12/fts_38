class Admin::UsersController < ApplicationController
  load_and_authorize_resource 
  before_action :admin_only

  def index
    @users = User.paginate page: params[:page], per_page: Settings.length.page 
  end

  def show 	
  end

  def update
    user = User.find params[:id]
    if user.update_attributes user_params
      flash[:success] = t "users.update.success"
    else
      flash[:danger] = t "users.update.error"
    end
    redirect_to users_path
  end

  def destroy
    user = User.find params[:id]
    if @user.destroy
      flash[:success] = t "users.destroy.success"
    else
      flash[:danger] = t "users.destroy.error"
    end
    redirect_to users_path
  end

  private
  def admin_only  
    redirect_to root_path unless current_user.try :admin?
  end

  def user_params
    params.require(:user).permit :role
  end
end
