class Driver < ActiveRecord::Base
  has_many :reservations
  has_many :notifications
  has_many :notify_cars, through: :notifications, source: :car
  has_many :reserve_cars, through: :reservations, source: :car
  validates :name, presence: true
  validates :password, presence: true, on: :create
  has_secure_password validations: false

end