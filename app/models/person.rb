class Person < ActiveRecord::Base
  self.table_name = "persons"
  
  after_save :repr
  
  has_one :user
  has_one :member
  has_many :party_memberships

  validates :name, presence: true
  
  def user?
    not self.user.nil?
  end
  
  def member?
    not self.member.nil?
  end
  
  protected
  
    def repr
      PartyMembership.create( party: Party.create( name: self.name, description: 'Party for ' + self.name ), person: self )
    end

end
