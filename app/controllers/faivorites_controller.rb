class FaivoritesController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    favorite = current_user.favorites.new(story_id: @story.id)
    favorite.save
  end

  def destroy
    @story = Story.find(params[:story_id])
    favorite = current_user.favorites.find_by(story_id: @story.id)
    favorite.destroy
  end
  
end
