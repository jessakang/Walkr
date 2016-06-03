class SessionsController < ApplicationController

  before_action :authenticate_user, :only => [:new]
  skip_before_action :fetch_user, :only => [:new, :create]

  def new
  end

  def create
    # Find the user using params[:email]
    user_type = params[:type]
    if user_type == "owner"
      user = Owner.find_by email: params[:email]
    elsif user_type == "walker"
      user = Walker.find_by email: params[:email]
    end
    if user.present? && user.authenticate( params[:password] )
      flash[:success] = "Successfully logged in."
      # Permanently store the id of the user that we found using the email in the session variable

      if user_type == "owner"
        redirect_to owner_path user.id
        session[:owner_id] = user.id
      else
        redirect_to walker_path user.id
        session[:walker_id] = user.id
      end
    else
      flash[:error] = "Invalid email or password"
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  def destroy
    session[:walker_id] = nil
    session[:owner_id] = nil
    # binding.pry
    redirect_to login_path
  end

  private
  def authenticate_user
    redirect_to root_path if session[:walker_id].present? || session[:owner_id].present?
  end

end
