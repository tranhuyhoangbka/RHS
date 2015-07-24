class AddNetworkToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :network, :boolean
  end
end
