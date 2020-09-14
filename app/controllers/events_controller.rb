class EventsController < ApplicationController
  def index
    @exhibition = Exhibition.find(params[:exhibition_id])
  end
end
