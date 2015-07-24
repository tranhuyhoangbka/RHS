class AddTableToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :table, :boolean
  end
end
