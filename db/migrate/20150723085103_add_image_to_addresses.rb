class AddImageToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :image, :string
  end
end
