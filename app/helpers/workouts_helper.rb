module WorkoutsHelper
  def check_user(workout)
    current_user.id == workout.user_id
  end
end
