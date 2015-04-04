class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :head_id
      t.integer :assistant_id
      t.integer :members_id

      t.timestamps null: false
    end
  end
end
