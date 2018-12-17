class AddUserInfoToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :phone_number, :name
  end
end
