class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # This will run on every page
  before_action :fetch_user


  private
  def fetch_user
    if session[:walker_id].present?
      @current_user = Walker.find_by(:id => session[:walker_id] )
    elsif session[:owner_id].present?
      @current_user = Owner.find_by(:id => session[:owner_id] )
    end
    # binding.pry
    unless @current_user.present?
      session[:owner_id] = nil
      session[:walker_id] = nil
      redirect_to login_path
    end
  end

end
