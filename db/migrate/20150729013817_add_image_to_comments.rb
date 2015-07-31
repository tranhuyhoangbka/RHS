class AddImageToComments < ActiveRecord::Migration
  def change
    add_column :comments, :image, :string
    change_column :comments, :content, :text
  end
end
