class User < ActiveRecord::Base

  belongs_to :person

  validates :person, :unom, :email, :name_f, :name_l, :status, presence: true
  validates :uname, format: { with: /\A[A-Za-z0-9_-.]+\z/, message: "invalid email address" }
  validates :name_f, :name_l, format: { with: /\A[A-Z][a-z]+\z/, message: "invalid email address" }
  validates :name_m, format: { with: /\A[A-Z][a-z]+( [A-Z][a-z]+)*\z/, message: "invalid email address" }
  validates :email, format: { with: /\A[a-zA-Z0-9_-.]+@[a-zA-Z.]+\z/, message: "invalid email address" }

end
