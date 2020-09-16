class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @exhibition = Exhibition.find(params[:exhibition_id])
    if current_organizer.id != @exhibition.organizer.id
      redirect_to root_path
    end

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
    if current_organizer.id != @event.organizer.id
      redirect_to root_path
    end
  end

  def update
    if @event.update(event_params)
      redirect_to exhibition_events_path(@event.exhibition.id)
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to exhibition_events_path(@event.exhibition.id)
    else
      render exhibition_events_path(@event.exhibition.id)
    end 
  end

  private
  
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:open_date, :open_time, :close_time).merge(exhibition_id: params[:exhibition_id])
  end
end
