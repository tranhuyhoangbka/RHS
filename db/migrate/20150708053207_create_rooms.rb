class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.float :square
      t.boolean :parking
      t.integer :facility
      t.float :price
      t.string :image

      t.references :address, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
