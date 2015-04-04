class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.string :link
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
