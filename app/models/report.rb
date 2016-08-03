class Report < ApplicationRecord
  belongs_to :profile_summary
  has_one :emotion_tone
  has_one :language_tone
  has_one :social_tone

  validates :text, presence: true
end
