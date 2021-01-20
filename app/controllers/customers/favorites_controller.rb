class Customers::FavoritesController < ApplicationController
  def circles_index
  end

  def events_index
  end

  def create
   favorite = current_customer.favorites.new(circle_id: circle.id)
   favorite.save
   redirect_to request.referer
  end

  def destroy
   @circle = Circle.find(params[:circle_id])
   @favorite = current_customer.favorites.new(circle_id: circle.id)
   @favorite.destroy
   redirect_to request.referer
  end
end
