class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :show, :destroy]
  
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
      redirect_to @workout, alert: "Workout successfully created!" 
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @workout.update(workout_params)
      redirect_to @workout, alert: "Workout successfully updated!" 
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, alert: "Workout deleted!"
  end
  
  private
  
  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :time, :difficulty)
  end
end
