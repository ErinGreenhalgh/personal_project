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
    attributes = {"anger"   => 369,
                  "disgust" => 141,
                  "fear"    => 82,
                  "joy"     => 525,
                  "sadness" => 115}
    expect(formatter.emotion_attributes(user)).to eq attributes
  end

  it "finds language attributes" do
    attributes = {"analytical" => 472,
                  "confident"  => 963,
                  "tentative"  => 0}
    expect(formatter.language_attributes(user)).to eq attributes
  end

  it "finds social attributes" do
    attributes = {"openness"          => 53,
                  "conscientiousness" => 936,
                  "extraversion"      => 194,
                  "agreeableness"     => 896,
                  "emotional_range"   => 973}
    expect(formatter.social_attributes(user)).to eq attributes
  end
end
