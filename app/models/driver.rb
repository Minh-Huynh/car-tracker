class Driver < ActiveRecord::Base
  has_many :reservations
  has_many :cars, through: :reservations
  validates :name, presence: true
  validates :password, presence: true, on: :create
  has_secure_password validations: false

end