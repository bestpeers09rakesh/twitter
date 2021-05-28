# frozen_string_literal: true

class UserController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_edit_path
    else
      render :new
    end
  end

  def edit
    @user = Current.user
    render "password_edit"
  end

  def update
    if Current.user.authenticate(params[:user][:oldpassword])
      unless params[:user][:password] == params[:user][:password_confirmation]
        flash.now[:alert] = 'Password and confirm Password did not match'
        render "password_edit"
      else
        Current.user.update(params_password)
        redirect_to root_path
      end   
    else
      flash.now[:alert] = 'Old password did not match'
      render "password_edit"
    end  
  end

  def rest_password
    if request.post?
      puts "Hello this post "
    else
      puts "this get"
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def params_password
    params.require(:user).permit(:password)
  end
end
