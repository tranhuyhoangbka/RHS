class AddParkingToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :parking, :boolean
  end
end
