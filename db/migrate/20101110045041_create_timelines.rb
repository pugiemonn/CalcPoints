class CreateTimelines < ActiveRecord::Migration
  def self.up
    create_table :timelines do |t|
      t.integer :user_id
      t.integer :point
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :timelines
  end
end
