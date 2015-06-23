class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.update({
      token: auth[:credentials][:token],
      username: auth[:info][:nickname]
    })
    user
  end
end
