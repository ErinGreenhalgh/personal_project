class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :profile_summary, foreign_key: true
      t.text :text

      t.timestamps true
    end
  end
end
