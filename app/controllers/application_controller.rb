class ApplicationController < ActionController::Base

  before_action :store_current_location, unless: :devise_controller?
  helper_method :back_url

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource)
    stored_location_for(:user) || (respond_to?(:root_path) ? root_path : thredded.root_path)
  end

  def back_url
    session[:user_return_to] || (respond_to?(:root_path) ? root_path : thredded.root_path)
  end
end
