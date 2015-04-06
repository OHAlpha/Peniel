class CreatePartyMemberships < ActiveRecord::Migration
  def change
    create_table :party_memberships do |t|
      t.integer :party_id, null: false
      t.integer :person_id, null: false
      t.index [ :party_id, :person_id ], unique: true

      t.timestamps null: false
    end
  end
end
