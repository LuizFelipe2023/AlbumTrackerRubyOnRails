class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  allow_unauthenticated_access only: %i[new create]

  def index
    @users = User.order(:name)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was successfully created. Please log in."
      redirect_to new_sessions_path
    else
      flash.now[:alert] = "There was an error creating the user."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."

      if @user == Current.user
        Current.user.reload
      end

      redirect_to edit_user_path(@user)
    else
      flash.now[:alert] = "There was an error updating the user."
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "User was successfully deleted."
    else
      flash[:alert] = "There was an error deleting the user."
    end
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    permitted = [:name, :email_address, :username, :password, :password_confirmation, :avatar]
    permitted << :role if Current.user&.admin?
    params.require(:user).permit(permitted)
  end
end
