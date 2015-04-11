class Contact < ActiveRecord::Base

  belongs_to: :home_address, class_name: 'Address'

  validates :home_phone, :work_phone, :cell_phone, format: { with: /\A(\([1-9]\d\d\)\d{3}-\d{4})|\d{10}\z/, message: "invalid phone number" }

end
