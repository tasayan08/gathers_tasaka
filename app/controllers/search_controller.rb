class SearchController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "circle"
      @records = Circle.search_for(@content)
    else
      @records = Event.search_for(@content)
    end
  end
  

  def search_pref
    session[:pref]=params[:pref]
    redirect_to request.referer
  end
  

  def destroy
    session.delete(:pref)
    redirect_to request.referer
  end
end