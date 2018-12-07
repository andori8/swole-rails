class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id]
      @exercises = Exercise.all.specific_category(params[:category_id])
    else
      @exercises = Exercise.all
    end

    respond_to do |f|
      f.html
      f.json {render json: @exercises}
    end
  end

  def new
    @exercise = Exercise.new
  end

  def ten
    @hard_exercises = Exercise.ten_reps_or_more
  end

  def show
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user_id = current_user.id
    if @exercise.save
      redirect_to @exercise, alert: "Exercise created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.id == @exercise.user_id
      if @exercise.update(exercise_params)
        redirect_to @exercise, alert: "Exercise updated."
      else
        render :edit
      end
    else
      redirect_to @exercise, alert: "Can't do that."
    end
  end

  def destroy
    if current_user.id == @exercise.user_id
      @exercise.destroy
      redirect_to exercises_path, alert: "Exercise deleted."
    else
      redirect_to @exercise, alert: "Can't do that."
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :sets, :reps, :description, :category_id)
  end

end
