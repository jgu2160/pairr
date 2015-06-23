class UsersController < ApplicationController
  def edit
  end

  def update
    language_ids = params.select { |key, value| key.to_s.match(/^language_/) }.values
    UserLanguage.where(user_id: current_user.id).delete_all
    language_ids.each do |id|
      UserLanguage.create(user_id: current_user.id, language_id: id)
    end
    current_user.update(description: params[:user][:description])
    redirect_to root_path
  end
end
