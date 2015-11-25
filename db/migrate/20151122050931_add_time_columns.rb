class AddTimeColumns < ActiveRecord::Migration
  def change
    add_column :cars, :reserved_time, :datetime
    add_column :cars, :return_time, :datetime
  end
end
