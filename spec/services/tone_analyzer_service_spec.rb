require "rails_helper"

RSpec.describe "tone analyzer service" do
  fixtures :users, :profile_summaries
  it "gets the tone report data for the user's profile summary" do
    VCR.use_cassette("tone_report") do
      user = users(:erin)
      summary = profile_summaries(:sample)
      report = ToneAnalyzerService.new.analyze_text(user)

      expect(report["document_tone"].keys).to eq ["tone_categories"]
    end
  end
end
