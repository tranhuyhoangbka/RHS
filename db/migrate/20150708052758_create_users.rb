class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.integer :age
      t.string :job
      t.string :address
      t.string :phone_number
      t.string :provider
      t.string :uid
      t.integer :role

      t.timestamps null: false
    end
  end
end
