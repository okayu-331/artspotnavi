class OrganizersController < ApplicationController
  before_action :authenticate_organizer!

  def show
    @organizer = Organizer.find(params[:id])
    @exhibitions = @organizer.exhibitions
    if current_organizer.id != @organizer.id
      redirect_to root_path
    end
  end
end
