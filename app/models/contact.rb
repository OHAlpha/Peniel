class Contact < ActiveRecord::Base

  validates :home_phone, :work_phone, :cell_phone, format: { with: /\A(\([1-9]\d\d\)\d{3}-\d{4})|\d{10}\z/, message: "invalid phone number" }

end
