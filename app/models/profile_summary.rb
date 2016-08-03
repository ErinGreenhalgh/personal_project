class ProfileSummary < ActiveRecord::Base
  belongs_to :user
  has_many :reports

  def self.get_text(user)
    data = LinkedinService.new(user.oauth_token).get_profile_information
    ProfileSummary.create!(content: data["summary"], user: user)
  end
end
