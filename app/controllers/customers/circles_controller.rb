class Customers::CirclesController < ApplicationController

  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
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
    @circle.destroy
    redirect_to customer_circles_path
  end


  private

  def circle_params
    params.require(:circle).permit(:image, :explanation, :circle_name, :place, :genre_id)
  end

end
