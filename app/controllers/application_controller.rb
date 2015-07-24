class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location

  def store_location
    session[:return] = params[:return] if params[:return].present?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) <<
      [:name, :age, :address, :job, :phone_number]
  end

  def after_sign_in_path_for resource
    session.delete :return || root_path
  end
end
