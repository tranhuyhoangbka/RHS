class AddTelevisionToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :television, :boolean
  end
end
