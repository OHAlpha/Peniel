class Organization < ActiveRecord::Base

  belongs_to :head, class_name: 'Party'
  belongs_to :assistant, class_name: 'Party'
  belongs_to :members, class_name: 'Party'

end
