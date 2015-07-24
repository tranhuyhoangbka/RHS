class AddAvatarToImages < ActiveRecord::Migration
  def change
    add_column :images, :main, :boolean
  end
end
