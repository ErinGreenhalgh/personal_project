require 'rails_helper'

RSpec.describe "report generator service" do
  fixtures :users, :profile_summaries, :reports
  let(:generator) { ReportGeneratorService.new }


  it "creates a report entry in the database" do
    user = users(:erin)
    summary = profile_summaries(:sample)

    generator.create_report_entry(user)
    expect(Report.first.text).to eq summary.content
  end

  it "creates an emption tone object associated with a report" do
    user = users(:erin)
    report = reports(:version_one)
    tone = generator.create_emotion_tone(user, report)
    expect(tone.class).to eq EmotionTone
    expect(EmotionTone.count).to eq 1
    expect(tone.report).to eq report
  end

  it "creates associated language tone object based on a report" do
    user = users(:erin)
    report = reports(:version_one)
    tone = generator.create_language_tone(user, report)
    expect(tone.class).to eq LanguageTone
    expect(LanguageTone.count).to eq 1
    expect(tone.report).to eq report
  end

  it "create associated social tone object based on a report" do
    user = users(:erin)
    report = reports(:version_one)
    tone = generator.create_social_tone(user, report)
    expect(tone.class).to eq SocialTone
    expect(SocialTone.count).to eq 1
    expect(tone.report).to eq report
  end

  it "creates all associated tone objects for a report" do
    user = users(:erin)
    report = reports(:version_one)
    generator.create_tone_reports(user, report)
    expect(EmotionTone.count).to eq 1
    expect(LanguageTone.count).to eq 1
    expect(SocialTone.count).to eq 1
  end 
end
