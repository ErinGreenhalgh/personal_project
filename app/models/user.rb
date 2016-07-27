class User < ApplicationRecord
  def self.from_omniauth(auth_hash)
    user = User.find_or_create_by(uid: auth_hash["uid"])
    user.update_attributes(
      uid:         auth_hash.uid,
      name:        auth_hash.info.name,
      oauth_token: auth_hash.credentials.token
    )
    user
  end
end
