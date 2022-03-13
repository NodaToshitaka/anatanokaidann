class SortsController < ApplicationController
  def sort
    selection = params[:sort]
    stories = Story.sort(selection)
    @stories = Kaminari.paginate_array(stories).page(params[:page])
  end
end
