class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.integer :user_id
      t.integer :point
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end
