class CreateSpentPoints < ActiveRecord::Migration
  def self.up
    create_table :spent_points do |t|
      t.integer :user_id
      t.integer :point
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :spent_points
  end
end
