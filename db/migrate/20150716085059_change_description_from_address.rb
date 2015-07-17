class ChangeDescriptionFromAddress < ActiveRecord::Migration
  def change
    change_column :addresses, :description, :text
  end
end
