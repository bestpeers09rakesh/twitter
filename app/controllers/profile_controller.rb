class ProfileController < ApplicationController

  before_action :require_login

  def show
    @profile = Profile.find_by(user_id: Current.user.id)
  end

  def edit
    @profile = Profile.find_by(user_id: Current.user.id)
  end

  def update
    @profile = Profile.find_by(user_id: Current.user.id)
    if @profile.update(profile_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :last_name, :dob, :mobile, :image)
  end
end

