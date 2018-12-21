class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  
  def current_user  # uses lazy assignment, find user by current session_token
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in? # bang bang
    !!current_user
  end

  def logout! # reset user's token, @curr_u = nil, clear current session token
    current_user.reset_session_token!
    @current_user = nil # reset curren_user ivar
    session[:session_token] = nil # have to do this AFTER resetting session token
  end

  def login!(user) # assign val of current session token to be the user's resetted token
    session[:session_token] = user.reset_session_token!
  end

  def ensure_logged_in # redirect logged-out users to log-in page
    redirect_to new_session_url unless logged_in?
  end
end
