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
end
