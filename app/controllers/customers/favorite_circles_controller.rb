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
  end

private

  def favo_params
    params.require(:circle_id)
  end

end
