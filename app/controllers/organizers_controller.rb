class OrganizersController < ApplicationController
  def show
    @organizer = Organizer.find(params[:id])
    @exhibitions = @organizer.exhibitions
  end
end
