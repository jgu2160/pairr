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
    positive_match = UserMatch.where(user_2: current_user.id, user_1_choice: 1, user_2_choice: nil).first

    if positive_match
      return positive_match.id
    end

    @next_match ||= current_user.potential_matches.sample
  end
end
