class CreateEmotionTones < ActiveRecord::Migration[5.0]
  def change
    create_table :emotion_tones do |t|
      t.integer :anger
      t.integer :disgust
      t.integer :fear
      t.integer :joy
      t.integer :sadness
      t.references :report, foreign_key: true

      t.timestamps true
    end
  end
end
