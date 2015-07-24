class AddBedToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :bed, :boolean
  end
end
