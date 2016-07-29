require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  it "gets the user's profile summary from linkedin" do
    VCR.use_cassette(:profile_summary) do
      user = users(:erin)

      ps = ProfileSummary.get_text(user)
      expect(ps.summary[0..14]).to eq "I set extremely"
    end
  end
end
