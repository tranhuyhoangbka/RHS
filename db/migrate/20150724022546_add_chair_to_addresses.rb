class AddChairToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :chair, :boolean
  end
end
