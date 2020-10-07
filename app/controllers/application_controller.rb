class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["ART_BASIC_AUTH_USER"] && password == ENV["ART_BASIC_AUTH_PASSWORD"]
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company_name])
  end
end
