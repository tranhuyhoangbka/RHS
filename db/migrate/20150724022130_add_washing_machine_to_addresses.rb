class AddWashingMachineToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :washing_machine, :boolean
  end
end
