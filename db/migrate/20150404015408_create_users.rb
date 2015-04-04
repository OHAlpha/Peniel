class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :person_id, null: false
      t.string :unom, null: false
      t.index :unom, unique: true
      t.string :email, null: false
      t.index :email, unique: true
      t.string :passhash
      t.string :salt
      t.integer :name_t
      t.string :name_f, null: false
      t.string :name_m
      t.string :name_l, null: false
      t.integer :name_s
      t.index [ :name_t, :name_f, :name_m, :name_l, :name_s ], name: 'fullname', unique: true
      t.integer :status, null: false
      t.integer :contact_id
      t.date :birthdate

      t.timestamps null: false
    end
    #add_index :name_t, :name_f, :name_m, :name_l, :name_s, name: 'fullname'
  end
end
