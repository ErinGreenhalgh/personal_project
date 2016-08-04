require "rails_helper"

RSpec.describe "profile summary" do
  fixtures :users, :profile_summaries

  it "creates a profile summary instance in db from API data" do
    VCR.use_cassette(:profile_summary) do
      user = users(:erin)
      summary = profile_summaries(:sample)

      ps = ProfileSummary.get_text(user)
      expect(ProfileSummary.first.content).to eq summary.content
    end
  end

end
