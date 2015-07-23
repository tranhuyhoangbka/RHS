class AddFacilityToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :facility, :string
  end
end
