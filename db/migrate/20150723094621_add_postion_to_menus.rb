class AddPostionToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :postion, :integer
  end
end
