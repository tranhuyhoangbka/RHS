class AddIsHomeToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :is_home, :boolean
  end
end
