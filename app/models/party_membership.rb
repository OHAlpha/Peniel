class PartyMembership < ActiveRecord::Base

  belongs_to :party
  belongs_to :person

end
