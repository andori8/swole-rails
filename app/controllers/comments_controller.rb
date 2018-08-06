class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @workout = Workout.find(params[:workout_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @workout = Workout.find(params[:workout_id])
    @comment.workout_id = @workout.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to workout_path(@workout)
    else
      redirect_to workout_path(@workout)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @workout = Workout.find(params[:workout_id])
  end

  def update
    @comment = Comment.find(params[:id])
    @workout = Workout.find(params[:workout_id])
    if @comment.update(comment_params)
      redirect_to workout_path(@workout)
    else
      redirect_to workout_path(@workout)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    @workout = Workout.find(params[:workout_id])
    redirect_to workout_path(@workout)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
