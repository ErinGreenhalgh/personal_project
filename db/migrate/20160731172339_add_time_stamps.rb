class AddTimeStamps < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :profile_summaries
  end
end
