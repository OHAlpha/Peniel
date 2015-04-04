class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :type
      t.integer :source_id
      t.integer :dest_id

      t.timestamps null: false
    end
  end
end
