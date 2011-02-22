class CreateMovements < ActiveRecord::Migration
  def self.up
    create_table :movements do |t|
      t.date :date
      t.string :clasification
      t.string :concept
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :movements
  end
end
