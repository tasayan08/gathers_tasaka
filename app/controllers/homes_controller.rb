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


  def new_guest
    customer = Customer.find_or_create_by!(name: 'guest', email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
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
