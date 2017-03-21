class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  respond_to :json

  protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format =~ %r{application/json} }
  # skip_before_filter :verify_authenticity_token

  def ping
    respond_with :ok, location: nil
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:document, :name, :last_name, :address, :profile_id, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :address, :email])
  end

  # def set_access_control_headers
    # headers['Access-Control-Allow-Origin'] = 'http://localhost:4000'
  # end
end
