require "rails_helper"

RSpec.describe "tone data formatter service" do
  fixtures :users, :profile_summaries

  let(:user)      { users(:erin) }
  let(:formatter) { ToneDataFormatterService.new }

  it "isolates an array of tone categories" do
    VCR.use_cassette("tone_report") do
      expect(formatter.categories(user).count).to eq 3
    end
  end

  it "finds tones by category" do
      expect(formatter.emotion_tones(user)["category_id"]).to eq "emotion_tone"
      expect(formatter.language_tones(user)["category_id"]).to eq "language_tone"
      expect(formatter.social_tones(user)["category_id"]).to eq "social_tone"
  end

  it "finds emotion attributes" do
    attributes = {"anger"   => 429,
                  "disgust" => 231,
                  "fear"    => 288,
                  "joy"     => 28,
                  "sadness" => 620}
    expect(formatter.emotion_attributes(user)).to eq attributes
  end

  it "finds language attributes" do
    attributes = {"analytical" => 0,
                  "confident"  => 0,
                  "tentative"  => 715}
    expect(formatter.language_attributes(user)).to eq attributes
  end

  it "finds social attributes" do
    attributes = {"openness"          => 190,
                  "conscientiousness" => 66,
                  "extraversion"      => 904,
                  "agreeableness"     => 320,
                  "emotional_range"   => 489}
    expect(formatter.social_attributes(user)).to eq attributes
  end
end
