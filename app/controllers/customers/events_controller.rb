class Customers::EventsController < ApplicationController

  def all_index
    if session[:pref].blank?
     @events = Event.all
    else
     @events = Event.where(place: session[:pref])
    end
  end

  def index
    @myevents = Event.where(circle_id: params[:circle_id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to customer_circle_event_path(@event)
    else
      render "edit"
    end
  end

  def new
     @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.circle_id = params["circle_id"]
    @event.customer_id = params["customer_id"]
    if @event.save
      redirect_to customer_circle_events_path
    else
      render "new"
    end
  end

  def destroy
   @event = Event.find(params[:id])
   if @event.destroy
    redirect_to customer_circle_events_path
   else
    render "show"
   end
  end

  private

  def event_params
   params.require(:event).permit(:customer_id, :circle_id, :genre_id, :title, :body, :image, :place)
  end

end

