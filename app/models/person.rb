class Person < ActiveRecord::Base
  self.table_name = "persons"
  
  has_one :user
  has_one :member

  validates :name, presence: true
  
  def user?
    not self.user.nil?
  end
  
  def member?
    not self.member.nil?
  end

end
