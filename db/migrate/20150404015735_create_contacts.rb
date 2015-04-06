class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :home_address_id
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :fax

      t.timestamps null: false
    end
  end
end
