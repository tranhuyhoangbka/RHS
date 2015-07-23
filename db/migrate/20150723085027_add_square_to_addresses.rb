class AddSquareToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :square, :float
  end
end
