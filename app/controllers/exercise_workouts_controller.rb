class ExerciseWorkoutsController < ApplicationController
  before_action :find_workout, only: [:create]

  def create
    exercise_workout = @workout.exercise_workouts.build(exercise_id: params[:exercise_id])
    if exercise_workout.save
      redirect_to workout_path(@workout)
    else
      redirect_to workout_path(@workout)
    end
  end

  def destroy
    ExerciseWorkout.find_by(exercise_id: params[:id]).destroy
    redirect_to exercises_path
  end

  private

  def find_workout
    @workout = current_user.workouts.find(params[:exercise_workout][:workout_id])
  end
end
