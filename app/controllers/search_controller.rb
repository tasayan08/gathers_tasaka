class SearchController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "circle"
      @records = Circle.search_for(@content)
    else
      @records = Ivenmt.search_for(@content)
    end
  end

  def index
  end
end
