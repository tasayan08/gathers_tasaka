class Customers::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
   @reviews = Review.where(circle_id: params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = params["customer_id"]
    @review.circle_id = params["circle_id"]
    @review.rank = params.permit(:rank)["rank"]
    if @review.save
     redirect_to customer_circle_path(@review.customer.id, @review.circle.id)
    else
     render "new"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to customer_circle_path(@review.customer.id, @review.circle.id)
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :circle_id, :title, :body, :rank, :image)
  end
end
