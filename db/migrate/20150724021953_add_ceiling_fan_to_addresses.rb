class AddCeilingFanToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :ceiling_fan, :boolean
  end
end
