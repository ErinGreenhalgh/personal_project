class ProfileSummary < ActiveRecord::Base
  belongs_to :user

  attr_reader :summary

  def initialize(profile_data)
    @summary = profile_data["summary"]
  end

  def self.get_text(user)
    data = LinkedinService.new.get_profile_information(user.oauth_token)
    ProfileSummary.new(data)
  end
end
