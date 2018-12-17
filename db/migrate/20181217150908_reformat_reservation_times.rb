class ReformatReservationTimes < ActiveRecord::Migration[5.2]
  def change
    drop_table :reservations
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.datetime :date
      t.integer :party_size
      t.integer :time
      t.timestamps
    end
  end
end
