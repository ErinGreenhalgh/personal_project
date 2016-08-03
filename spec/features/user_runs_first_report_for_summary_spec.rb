require 'rails_helper'

RSpec.feature "user runs first report for summary" do
  fixtures :users, :profile_summaries
  scenario "by clicking the Analyze button" do
    VCR.use_cassette("profile_summary") do
      user = users(:erin)
      summary = profile_summaries(:sample)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_summary_path(summary)

      within(".profile-summary-form") do
        expect(page).to have_content "Profile Summary"
      end

      within("#profile-summary") do
        expect(page).to have_content summary.content
      end

      click_button "Analyze"
      report = Report.last

      expect(current_path).to eq "/profile_summary/reports/#{report.id}"

      within("#report") do
        expect(page).to have_content("Version #{report.id}")
        expect(page).to have_content(summary.content)

        within("#emotion") do
          expect(page).to have_content(report.emotion_tone.anger)
          expect(page).to have_content(report.emotion_tone.disgust)
          expect(page).to have_content(report.emotion_tone.fear)
          expect(page).to have_content(report.emotion_tone.joy)
          expect(page).to have_content(report.emotion_tone.sadness)
        end

        within("#language") do
          expect(page).to have_content(report.language_tone.analytical)
          expect(page).to have_content(report.language_tone.confident)
          expect(page).to have_content(report.language_tone.tentative)
        end

        within("#social") do
          expect(page).to have_content(report.social_tone.openness)
          expect(page).to have_content(report.social_tone.conscientiousness)
          expect(page).to have_content(report.social_tone.extraversion)
          expect(page).to have_content(report.social_tone.agreeableness)
          expect(page).to have_content(report.social_tone.emotional_range)
        end
      end
    end
  end
end
