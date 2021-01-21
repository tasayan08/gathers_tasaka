class Customers::FavoriteCirclesController < ApplicationController
  def create
    favo=FavoriteCircle.new(:circle_id=>params[:circle_id])
    favo.customer_id=current_customer.id
    favo.save
    redirect_to request.referer
  end

  def destroy
    # binding.pry
    FavoriteCircle.find_by(circle_id:params[:id],customer_id:current_customer.id).destroy
    redirect_to request.referer
  end

  def index
  #@circleにfavorite_circleテーブルから引っ張ってきたcircle_idを使ってCircleテーブルのIDを探して入れる。
   @circles=[]
   current_customer.favorite_circles.each do |x|
     @circles.push(x.circle)
    end
   # @favorite_circles=current_customer.favorite_circles
  end

private

  def favo_params
    params.require(:circle_id)
  end

end
