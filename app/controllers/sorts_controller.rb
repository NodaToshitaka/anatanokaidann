class SortsController < ApplicationController
  def sort
    selection = params[:sort]
    @stories = Story.sort(selection)
  end
end
