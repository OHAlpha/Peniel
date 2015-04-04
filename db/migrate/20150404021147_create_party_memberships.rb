class CreatePartyMemberships < ActiveRecord::Migration
  def change
    create_table :party_memberships do |t|
      t.integer :party_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
