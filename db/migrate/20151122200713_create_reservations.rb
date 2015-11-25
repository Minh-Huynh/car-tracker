class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :reserved_from
      t.datetime :reserved_to
      t.datetime :returned_at
      t.integer :car_id
      t.integer :driver_id
    end
  end
end
