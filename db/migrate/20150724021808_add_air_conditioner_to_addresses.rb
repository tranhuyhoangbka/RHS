class AddAirConditionerToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :air_conditioner, :boolean
  end
end
