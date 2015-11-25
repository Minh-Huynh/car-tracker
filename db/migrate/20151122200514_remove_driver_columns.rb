class RemoveDriverColumns < ActiveRecord::Migration
  def change
    remove_column :cars, :driver_id
    remove_column :cars, :reserved_time
    remove_column :cars, :return_time
  end
end
