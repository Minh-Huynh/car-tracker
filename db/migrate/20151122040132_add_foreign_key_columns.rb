class AddForeignKeyColumns < ActiveRecord::Migration
  def change
    add_column :cars, :driver_id, :integer
    add_column :drivers, :car_id, :integer
    add_column :cars, :make, :string
  end
end
