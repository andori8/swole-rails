class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user_id = current_user.id
    binding.pry
    if @exercise.save
      redirect_to @exercise
    else
      redirect_to exercises_path
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercises_path
    else
      redirect_to exercises_path
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :sets, :reps, :description, :category_id)
  end

end
