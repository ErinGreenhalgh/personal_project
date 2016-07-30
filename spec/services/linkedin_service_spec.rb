require 'rails_helper'

RSpec.describe "linkedin service" do
  fixtures :users
  let(:linkedin_service) { LinkedinService.new }

  scenario "returns the user's summary" do
    VCR.use_cassette("profile_summary") do
      user = users(:erin)
      data = linkedin_service.get_profile_information(user.oauth_token)
      expect(data.keys.count).to eq 1
      expect(data["summary"]).to be_truthy
    end
  end
end
