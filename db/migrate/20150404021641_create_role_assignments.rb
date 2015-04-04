class CreateRoleAssignments < ActiveRecord::Migration
  def change
    create_table :role_assignments do |t|
      t.integer :role_id, null: false
      t.integer :member_id, null: false
      t.index [ :role_id, :member_id ], unique: true

      t.timestamps null: false
    end
  end
end
