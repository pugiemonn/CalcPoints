class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.integer :user_id
      t.integer :point_sum
      t.integer :spent_sum
      t.string :message
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
