class HomeController < ApplicationController
  def index
    @exhibitions = Exhibition.with_attached_images.limit(6).order("created_at DESC")
  end
end
