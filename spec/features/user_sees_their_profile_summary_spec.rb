require "rails_helper"

RSpec.feature "user sees their profile summary" do
  fixtures :users
  scenario "when they visit the page for the summary" do
    VCR.use_cassette("profile_summary") do
      user = users(:erin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/erin/profile_summary"

      within("#profile-summary") do
        expect(page).to have_content user.profile_summary.content
      end
    end
  end
end
