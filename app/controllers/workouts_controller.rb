class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
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
    @workout = Workout.find(params[:id])
  end
  
  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to @workout, alert: "Workout successfully updated!" 
    else
      render :edit
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def destroy
    Workout.find(params[:id]).destroy
    redirect_to workouts_path
  end
  
  private

  def workout_params
    params.require(:workout).permit(:title, :time, :difficulty)
  end
end
