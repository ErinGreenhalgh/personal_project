class CreateProfileSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_summaries do |t|
      t.text :content
      t.references :user, foreign_key: true
    end
  end
end
