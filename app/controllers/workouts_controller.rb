class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :show, :destroy]
  include WorkoutsHelper

  def index
    @workouts = Workout.all
  end

  def home
    @workouts = current_user.workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    if @workout.save
      redirect_to @workout, alert: "Workout created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if check_user(@workout)
      if @workout.update(workout_params)
        redirect_to @workout, alert: "Workout updated."
      else
        render :edit
      end
    else
      redirect_to @workout, alert: "Can't do that."
    end
  end

  def show
  end

  def destroy
    if check_user(@workout)
      @workout.destroy
      redirect_to workouts_path, alert: "Workout deleted."
    else
      redirect_to workout_path(@workout), alert: "Can't do that."
    end
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :time)
  end
end
