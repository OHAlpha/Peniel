class Member < ActiveRecord::Base

  belongs_to :person
  has_one :maintainer
  has_one :administrator
  has_many :role_assignments
  
  def maintainer?
    not self.maintainer.nil?
  end
  
  def admin?
    not self.administrator.nil?
  end

end
