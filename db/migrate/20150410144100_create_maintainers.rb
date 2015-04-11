class CreateMaintainers < ActiveRecord::Migration
  def change
    create_table :maintainers do |t|
      t.integer :member_id
      t.text :description
      t.integer :permissions

      t.timestamps null: false
    end
  end
end
