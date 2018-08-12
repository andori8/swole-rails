class ExerciseWorkoutsController < ApplicationController
  before_action :set_workout, only: [:create]

  def create
    exercise_workout = @workout.exercise_workouts.build(exercise_id: params[:exercise_id])
    if exercise_workout.save
      redirect_to workout_path(@workout), alert: "Exercise added to workout."
    else
      redirect_to workout_path(@workout)
    end
  end

  def destroy
    @workout = current_user.workouts.find(params[:workout_id])
    ExerciseWorkout.find_by(exercise_id: params[:id]).destroy
    redirect_to workout_path(@workout)
  end

  private

  def set_workout
    @workout = current_user.workouts.find(params[:exercise_workout][:workout_id])
  end
end
