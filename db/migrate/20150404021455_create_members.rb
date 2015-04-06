class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :person_id, null: false
      t.index :person_id, unique: true
      t.date :since

      t.timestamps null: false
    end
  end
end
