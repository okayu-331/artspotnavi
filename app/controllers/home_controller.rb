class HomeController < ApplicationController
  def index
    @exhibitions = Exhibition.with_attached_image.limit(6).order("created_at DESC")
  end
end
