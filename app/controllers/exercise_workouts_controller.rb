class ExerciseWorkoutsController < ApplicationController
  before_action :set_workout, only: [:create]

  def create
    exercise_workout = @workout.exercise_workouts.build(exercise_id: params[:exercise_id])
    if exercise_workout.save
      redirect_to workout_path(@workout), alert: "Exercise added."
    else
      redirect_to workout_path(@workout)
    end
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
    if current_user.id == @workout.user_id
      ExerciseWorkout.find_by(exercise_id: params[:id]).destroy
      redirect_to workout_path(@workout), alert: "Exercise deleted."
    else
      redirect_to workout_path(@workout), alert: "Can't do that."
    end
  end

  private

  def set_workout
    @workout = current_user.workouts.find(params[:exercise_workout][:workout_id])
  end
end
