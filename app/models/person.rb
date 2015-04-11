class Person < ActiveRecord::Base
  self.table_name = "persons"
  
  before_save :repr
  
  has_one :user
  has_one :member
  belongs_to :party
  has_many :party_memberships
  has_many :relationships

  validates :name, presence: true
  
  def user?
    not self.user.nil?
  end
  
  def member?
    not self.member.nil?
  end
  
  protected
  
    def repr
      if self.party_id.nil? or not Party.exists?(self.party_id)
        self.party = Party.create( name: self.name, description: 'Party for ' + self.name )
        PartyMembership.create( party: self.party, person: self )
      end
    end

end
