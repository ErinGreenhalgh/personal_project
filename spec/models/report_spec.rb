require 'rails_helper'

RSpec.describe Report, type: :model do
  it { should validate_presence_of(:text) }
  it { should belong_to(:profile_summary) }
  it { should have_one(:emotion_tone) }
  it { should have_one(:language_tone) }
  it { should have_one(:social_tone) }
end
