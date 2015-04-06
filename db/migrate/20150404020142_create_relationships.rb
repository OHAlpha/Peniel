class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :type, null: false
      t.integer :source_id, null: false
      t.integer :dest_id, null: false
      t.index [ :source_id, :dest_id ], unique: true

      t.timestamps null: false
    end
  end
end
