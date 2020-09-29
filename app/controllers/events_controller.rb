class EventsController < ApplicationController
  before_action :set_exhibition, only: [:index, :create]
  before_action :set_events, only: [:index, :create]
  before_action :set_event, only: [:edit, :update, :destroy]
  
  def index
    if current_organizer.id != @exhibition.organizer.id
      redirect_to root_path
    end

    @event = Event.new
  end
  
  def create
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
  
  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end
  
  def set_events
    @events = @exhibition.events.order("open_date ASC")
  end
  
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:open_date, :open_time, :close_time).merge(exhibition_id: params[:exhibition_id], organizer_id: current_organizer.id)
  end
end
