class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :house_number, null: false
      t.string :street, null: false
      t.string :apt_number
      t.string :city, null: false
      t.string :county
      t.integer :state, null: false
      t.integer :country
      t.string :zip
      t.string :zip_ext

      t.timestamps null: false
    end
  end
end
