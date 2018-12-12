class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :show, :destroy]

  def index
    @workouts = Workout.all
    respond_to do |f|
      f.html
      f.json {render json:@workouts}
    end
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
    if current_user.id == @workout.user_id
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
    @comments = @workout.comments
    @comment = Comment.new
  end

  def destroy
    if current_user.id == @workout.user_id
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
