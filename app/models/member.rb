class Member < ActiveRecord::Base

  belongs_to :person
  has_many :role_assignments

end
