class User < ApplicationRecord
  has_one :profile_summary

  def self.from_omniauth(auth_hash)
    user = User.find_or_create_by(uid: auth_hash["uid"])
    user.update_attributes(
      uid:         auth_hash.uid,
      name:        auth_hash.info.name,
      first_name:  auth_hash.info.first_name,
      last_name:   auth_hash.info.last_name,
      oauth_token: auth_hash.credentials.token
    )
    user
  end

  def to_param
    "#{first_name.parameterize}"
  end
end
