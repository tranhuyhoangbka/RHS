class AddSpecialLocationToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :special_location, :boolean
  end
end
