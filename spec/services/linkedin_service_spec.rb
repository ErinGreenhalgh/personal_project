require 'rails_helper'

RSpec.describe "linkedin service" do
  VCR.use_cassette("profile_summary") do
    let(:linkedin_service) { LinkedinService.new }

    scenario "returns the user's summary" do
      data = linkedin_service.get_profile_summary
      expect(data.count).to eq 1
      expect(data["summary"]).to be_truthy
    end
  end
end
