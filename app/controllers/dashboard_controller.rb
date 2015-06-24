class DashboardController < ApplicationController
  def index
    if  current_user
      user_id_matches = UserMatch.where(user_1: current_user.id, user_1_choice: 1, user_2_choice: 1).pluck(:user_2) + UserMatch.where(user_2: current_user.id, user_1_choice: 1, user_2_choice: 1).pluck(:user_1)
      @matches = user_id_matches.map { |id| User.find(id) }
    end
  end
end
