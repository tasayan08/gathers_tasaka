class HomesController < ApplicationController
  def top
    @genres = Genre.all
  end

  def about
  end

  def index
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)
  end


  private

  def match(value)
    if session[:pref].present?
    Event.where(genre_id: value, place: session[:pref])
    else
    Event.where(genre_id: value)
    end
  end

  def search_for(how, value)
    case how
    when 'match'
      match(value)
    end
  end

end
