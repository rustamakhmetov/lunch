require "application_responder"

class ApplicationController < ActionController::Base
  include ApplicationHelper

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation,
                                                              :current_password, :name])
  end
end
