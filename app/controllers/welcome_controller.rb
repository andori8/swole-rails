class WelcomeController < ApplicationController
  def index
    if current_user.name.blank? || current_user.username.blank?
      redirect_to edit_user_registration_path
    else
      redirect_to workouts_path
    end
  end
end
