class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show, :destroy]

  def index
    @exhibitions = Exhibition.includes(:organizer)
  end
  
  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to root_path
     else
      render :new
    end
  end

  def show
  end

  def destroy
    if @exhibition.destroy
      redirect_to organizer_path(current_organizer.id)
    else
      render organizer_path(current_organizer.id)
    end 
  end

  private
  
  def exhibition_params
    params.require(:exhibition).permit(
      :title, :subtitle, :venue, :description,
      :start_date, :end_date, :basic_open_time, :basic_close_time,
      :close_day, :special_open_day, :admission, :address, :access,
      :phone_number,:url, :prefecture_id, :image
    ).merge(organizer_id: current_organizer.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
end