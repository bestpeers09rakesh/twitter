# frozen_string_literal: true

class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
