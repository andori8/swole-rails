class CommentsController < ApplicationController
  before_action :set_workout
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.workout_id = @workout.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to workout_path(@workout), alert: "Comment created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.id == @comment.user_id
      if @comment.update(comment_params)
        redirect_to workout_path(@workout), alert: "Comment updated."
      else
        render :edit
      end
    else
      redirect_to workout_path(@workout), alert: "Can't do that."
    end
  end

  def destroy
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to workout_path(@workout), alert: "Comment deleted."
    else
      redirect_to workout_path(@workout), alert: "Can't do that."
    end
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
