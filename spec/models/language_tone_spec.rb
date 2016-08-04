require 'rails_helper'

RSpec.describe LanguageTone, type: :model do
  it { should belong_to :report }
end
