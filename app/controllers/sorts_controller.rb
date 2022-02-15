class SortsController < ApplicationController
  def sort
    selection = params[:sort]
    @stories = Story.sort(selection).page(params[:page])
  end
end
