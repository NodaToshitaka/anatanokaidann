class SearchesController < ApplicationController

  def search
    @word = params[:word]
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).order(created_at: :DESC).page(params[:page])
    elsif @range == "Story"
      @stories = Story.looks(params[:search], params[:word]).order(created_at: :DESC).page(params[:page])
    elsif @range == "Tag"
      @tags = Tag.looks(params[:search], params[:word])
    end
  end
end
