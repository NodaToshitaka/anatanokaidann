class StoriesController < ApplicationController
  def show
    @story = Story.find(params[:id])
    @comment = Comment.new
  end

  def index
    @stories = Story.all.order(created_at: :DESC)
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    tag_list = params[:story][:tag_names].split(",")
    if @story.save
      @story.tags_save(tag_list)
      redirect_to story_path(@story), notice: "You have created story successfully."
    else
      @stories = Story.all.order(created_at: :DESC)
      render :index
    end
  end

  def edit
    @story = Story.find(params[:id])
    redirect_to user_path(current_user) unless current_user == @story.user
  end

  def update
    @story = Story.find(params[:id])
    tag_list = params[:story][:tag_names].split(",")
    if @story.update(story_params)
      @story.tags_save(tag_list)
      redirect_to story_path(@story), notice: "You have updated story successfully."
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :body)
  end

end
