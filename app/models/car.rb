class Car < ActiveRecord::Base
  has_many :reservations
  has_many :drivers, through: :reservations
end