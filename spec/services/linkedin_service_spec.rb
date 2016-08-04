require 'rails_helper'

RSpec.describe "linkedin service" do
  fixtures :users

  scenario "returns the user's summary" do
    VCR.use_cassette("profile_summary") do
      user = users(:erin)
      linkedin_service = LinkedinService.new(user.oauth_token)
      data = linkedin_service.get_profile_information
      expect(data.keys.count).to eq 1
      expect(data["summary"]).to be_truthy
    end
  end
end
