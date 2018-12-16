class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :award_loyalty_points
  #def award_loyalty_points
    #if @reservation.save
      #params[:user][:loyalty_points] += 1
      #end
  #end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    helper_method :current_user

  def ensure_logged_in
    unless current_user
      redirect_to new_sessions_url
      flash[:alert] = "Please log in"
    end
  end

  def ensure_user_owns_restaurant
    unless current_user == @restaurant.user
      redirect_to new_sessions_url
    end
  end

end
