require "rails_helper"

RSpec.describe "profile summary" do
  fixtures :users

  it "creates a profile summary instance in db from API data" do
    VCR.use_cassette(:profile_summary) do
      user = users(:erin)

      ps = ProfileSummary.get_text(user)
      expect(ProfileSummary.first.content[0..14]).to eq "I set extremely"
    end
  end

end
