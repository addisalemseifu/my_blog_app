class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u| u.permit(:name, :surname, :email, :password) end # rubocop:disable Style/BlockDelimiters
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end
end
