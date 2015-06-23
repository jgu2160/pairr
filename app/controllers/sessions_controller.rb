class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_from_auth(auth)
    session[:user_id] = user.id
    if user.updated_at.to_i == user.created_at.to_i
      redirect_to edit_user_path(user)
    elsif user
      redirect_to root_path, notice: "Logged In"
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
