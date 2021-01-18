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

  def search_pref
    session[:pref]=params[:pref]
    binding.pry
    redirect_to request.referer
  end
end