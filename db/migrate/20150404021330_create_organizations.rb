class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.integer :head_id
      t.integer :assistant_id
      t.integer :members_id, null: false

      t.timestamps null: false
    end
  end
end
