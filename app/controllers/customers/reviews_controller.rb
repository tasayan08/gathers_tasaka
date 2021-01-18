class Customers::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    # binding.pry
   @reviews = Review.where(circle_id: params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = params["customer_id"]
    @review.circle_id = params["circle_id"]
    @review.rank = params.permit(:rank)["rank"]

    if @review.save
     redirect_to customer_circle_reviews_path
    else
     render "new"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to customer_circle_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :circle_id, :title, :body, :rank, :image)
  end
end
