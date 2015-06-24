class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.update({
      token: auth[:credentials][:token],
      username: auth[:info][:nickname],
      image: auth[:info][:image]
    })
    user
  end

  def potential_matches
    User.all.pluck(:id) -
      (UserMatch.where(user_1: self.id).pluck(:user_2) +
       UserMatch.where(user_2: self.id, user_1_choice: 0).pluck(:user_1) +
       UserMatch.where(user_2: self.id, user_2_choice: 0).pluck(:user_1) +
       UserMatch.where(user_2: self.id, user_2_choice: 1).pluck(:user_1) +
       [self.id])
  end
end
