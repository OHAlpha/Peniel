class Relationship < ActiveRecord::Base

  belongs_to :source, class_name: 'Person'
  belongs_to :dest, class_name: 'Person'

end
