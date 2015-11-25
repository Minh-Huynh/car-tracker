class CreateCarModel < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :model
      t.timestamps
    end
  end
end
