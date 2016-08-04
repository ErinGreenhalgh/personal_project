require 'rails_helper'

RSpec.describe EmotionTone, type: :model do
  it { should belong_to :report }
end
