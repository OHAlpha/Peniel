class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :unom
      t.string :email
      t.string :passhash
      t.string :salt
      t.integer :name_t
      t.string :name_f
      t.string :name_m
      t.string :name_l
      t.integer :name_s
      t.integer :status
      t.integer :contact_id
      t.date :birthdate

      t.timestamps null: false
    end
  end
end
