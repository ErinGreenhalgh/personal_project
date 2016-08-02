class CreateSocialTones < ActiveRecord::Migration[5.0]
  def change
    create_table :social_tones do |t|
      t.integer :openness
      t.integer :conscientiousness
      t.integer :extraversion
      t.integer :agreeableness
      t.integer :emotional_range
      t.references :report, foreign_key: true

      t.timestamps true 
    end
  end
end
