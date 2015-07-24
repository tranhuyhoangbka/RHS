class AddIsMainToImages < ActiveRecord::Migration
  def change
    add_column :images, :is_main, :boolean
  end
end
