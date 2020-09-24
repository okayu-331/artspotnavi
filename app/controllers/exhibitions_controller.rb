class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show, :edit, :update, :destroy]

  def index
    @exhibitions = Exhibition.includes(:organizer)
  end
  
  def new
    @exhibition = ExhibitionEvent.new
  end

  def create
    @exhibition = ExhibitionEvent.new(exhibition_params)
    if @exhibition.valid?
      @exhibition.save
      redirect_to root_path
     else
      render :new
    end
  end

  def show
  end

  def edit
    if current_organizer.id != @exhibition.organizer.id
      redirect_to root_path
    end
  end

  def update
    if @exhibition.update(exhibition_edit_params)
      redirect_to exhibition_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @exhibition.destroy
      redirect_to organizer_path(current_organizer.id)
    else
      render organizer_path(current_organizer.id)
    end 
  end

  def search
    @search_params = exhibition_search_params
    @exhibitions = Exhibition.search(@search_params).joins(:events)
  end
  
  private
  
  def exhibition_params
    params.require(:exhibition_event).permit(
      :title, :subtitle, :venue, :description,
      :start_date, :end_date, :basic_open_time, :basic_close_time,
      :close_day, :special_open_day, :admission, :address, :access,
      :phone_number,:url, :prefecture_id, images: []
    ).merge(organizer_id: current_organizer.id)
  end

  def exhibition_edit_params
    params.require(:exhibition).permit(
      :title, :subtitle, :venue, :description,
      :start_date, :end_date, :basic_open_time, :basic_close_time,
      :close_day, :special_open_day, :admission, :address, :access,
      :phone_number,:url, :prefecture_id, images: []
    ).merge(organizer_id: current_organizer.id)
  end

  def exhibition_search_params
      params.fetch(:search, {}).permit(:open_date, :open_time, :prefecture_id, :keyword)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
end