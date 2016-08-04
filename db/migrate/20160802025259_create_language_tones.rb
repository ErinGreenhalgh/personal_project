class CreateLanguageTones < ActiveRecord::Migration[5.0]
  def change
    create_table :language_tones do |t|
      t.integer :analytical
      t.integer :confident
      t.integer :tentative
      t.references :report, foreign_key: true

      t.timestamps true
    end
  end
end
