class Customers::CirclesController < ApplicationController

  def index
    @mycircles = Circle.all
  end

  def all_index
    if session[:pref].blank?
     @circles = Circle.all
    else
     @circles = Circle.where(place: session[:pref])
    end
  end

  def show
    @circle = Circle.find(params[:id])
    @c = @circle.place
    @p = JpPrefecture::Prefecture.find(@c)

    #平均点-------------------
    @reviews=Review.where(circle_id: @circle.id)
    review_sum=0
    @reviews.each do |x|
      review_sum = review_sum + x.rank
    end

    @review_ave=review_sum.to_f/@reviews.size
  end


  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.customer_id = current_customer.id
    if @circle.save
      redirect_to customer_circles_path
    else
      render "new"
    end
  end

  def edit
   @circle = Circle.find(params[:id])
  end

  def update
   @circle = Circle.find(params[:id])
   @circle.update(circle_params)
   redirect_to customer_circle_path(@circle)
  end

  def destroy
    @circle = Circle.find(params[:id])
    if @circle.destroy
     redirect_to customer_circles_path
    else
     render "show"
    end
  end


  private

  def circle_params
    params.require(:circle).permit(:image, :explanation, :circle_name, :place, :genre_id, :customer_id)
  end

end
