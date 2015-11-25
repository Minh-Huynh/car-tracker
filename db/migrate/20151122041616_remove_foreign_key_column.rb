class RemoveForeignKeyColumn < ActiveRecord::Migration
  def change
    remove_column :drivers, :car_id
  end
end
