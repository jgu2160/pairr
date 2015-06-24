class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_languages, :next_match

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_languages
    current_user.languages
  end

  def next_match
    @next_match ||= current_user.potential_matches.sample
  end
end
