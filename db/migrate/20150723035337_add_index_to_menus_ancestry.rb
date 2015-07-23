class AddIndexToMenusAncestry < ActiveRecord::Migration
  def self.up
    add_index :menus, :ancestry
  end

  def self.down
    remove_index :menus, :ancestry
  end
end
