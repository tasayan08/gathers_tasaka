class Customers::IventsController < ApplicationController

  def index
    @ivents = Ivenmt.all
  end

  def show
    @ivent = Ivenmt.find(params[:id])
  end

  def edit
    @ivent = Ivenmt.find(params[:id])
  end

  def update
    @ivent = Ivenmt.find(params[:id])
    if @ivent.update(ivent_params)
      redirect_to customer_circle_ivent_path(@ivent)
    else
      render "edit"
    end
  end

  def new
     @ivent = Ivenmt.new
  end

  def create
    @ivent = Ivenmt.new(ivent_params)
    @ivent.circle_id = params["circle_id"]
    @ivent.customer_id = params["customer_id"]
    if @ivent.save
      redirect_to customer_circle_ivents_path
    else
      render "new"
    end
  end

  def destroy
   @ivent = Ivenmt.find(params[:id])
   if @ivent.destroy
    redirect_to customer_circle_ivents_path
   else
    render "show"
   end
  end

  private

  def ivent_params
   params.require(:ivenmt).permit(:customer_id, :circle_id, :title, :body, :image)
  end

end
