class ProfileSummary < ActiveRecord::Base
  belongs_to :user

  def self.get_text(user)
    data = LinkedinService.new.get_profile_information(user.oauth_token)
    ProfileSummary.create!(content: data["summary"], user: user)
  end
end
