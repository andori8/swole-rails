class WelcomeController < ApplicationController
  def index
    if current_user.name.blank? || current_user.username.blank?
      edit_user_registration_path
    else
      redirect_to workouts_path
    end
  end
end
