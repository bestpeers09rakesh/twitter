# frozen_string_literal: true

class SessionController < ApplicationController
  def new
    @user = User.new
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@user}"
  end

  def login
    puts "I am in side of login please check >>>>>>>>>>>>>>>>>>>>>>>>>>>>#{params[:user][:email]}"    
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def logout
    if session[:user_id]
      session[:user_id] = nil
      redirect_to root_path, notice: "you have logged out"
    else
      redirect_to root_path, alert: "you have not logged in"
    end
  end

end
