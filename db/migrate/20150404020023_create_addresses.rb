class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :house_number
      t.string :street
      t.string :apt_number
      t.string :city
      t.string :county
      t.integer :state
      t.integer :country
      t.string :zip
      t.string :zip_ext

      t.timestamps null: false
    end
  end
end
