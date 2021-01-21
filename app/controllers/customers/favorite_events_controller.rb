class Customers::FavoriteEventsController < ApplicationController
  def create
    favo=FavoriteEvent.new(:event_id=>params[:event_id])
    favo.customer_id=current_customer.id
    favo.save
    redirect_to request.referer
    
  end

  def destroy
    FavoriteEvent.find_by(event_id:params[:id],customer_id:current_customer.id).destroy
    redirect_to request.referer
  end

  def index
    @events=[]
   current_customer.favorite_events.each do |x|
    @events.push(x.event)
    end
    # @favorite_circles=current_customer.favorite_circles
  end

end
