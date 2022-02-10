class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @comment = current_user.comments.new(post_comment_params)
    @comment.story_id = @story.id
    if @comment.save
      render :comments
    else
      render :error
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    comment = @story.comments.find(params[:id])
    comment.destroy
    render :comments
  end

  private

  def post_comment_params
    params.require(:comment).permit(:body, :rate)

  end
end
