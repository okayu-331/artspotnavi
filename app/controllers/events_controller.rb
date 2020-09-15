class EventsController < ApplicationController
  def index
    @exhibition = Exhibition.find(params[:exhibition_id])
    @event = Event.new
    @events = @exhibition.events.order("open_date ASC")
  end
  
  def create
    exhibition = Exhibition.find(params[:exhibition_id])
    @event = Event.new(event_params)
    if @event.save
      redirect_to exhibition_events_path(@event.exhibition.id)
     else
      render :index
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to exhibition_events_path(@event.exhibition.id)
    else
      render :edit
    end
  end

  private
  
  def event_params
    params.require(:event).permit(:open_date, :open_time, :close_time).merge(exhibition_id: params[:exhibition_id])
  end
end
