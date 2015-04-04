class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.text :description
      t.string :link
      t.integer :organization_id, null: false

      t.timestamps null: false
    end
  end
end
