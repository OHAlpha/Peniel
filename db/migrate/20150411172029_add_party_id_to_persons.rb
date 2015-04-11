class AddPartyIdToPersons < ActiveRecord::Migration
  def change
    add_column :persons, :party_id, :integer
  end
end
