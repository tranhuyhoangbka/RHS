class AddPriceToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :price, :float
  end
end
