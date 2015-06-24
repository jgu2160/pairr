class UserMatchesController < ApplicationController
  def create
    already_match = UserMatch.where(user_2: current_user.id, user_1: params[:user_2]).first || UserMatch.where(user_1: current_user.id, user_2: params[:user_2]).first

    unless already_match
      UserMatch.create(user_1: current_user.id, user_2: params[:user_2], user_1_choice: params[:user_1_choice])
    else
      already_match.update(user_2_choice: params[:user_1_choice])
    end

    next_match = current_user.potential_matches.sample

    if next_match
      redirect_to user_path(next_match)
    else
      redirect_to root_path
    end
  end
end
