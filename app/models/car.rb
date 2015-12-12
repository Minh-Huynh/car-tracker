class Car < ActiveRecord::Base
  has_many :reservations
  has_many :notifications
  has_many :notify_drivers, through: :notifications, source: :driver
  has_many :reserve_drivers, through: :reservations, source: :driver
  validates :make,:model, presence: true, length:{maximum:11}
  validates :year, presence: true, numericality: {only_integer: true}

  def current_reservation
    self.reservations.each do |reservation|
      if (reservation.reserved_from..reservation.reserved_to).cover?(Time.zone.now.utc)
        return reservation
      end
    end
    return
  end

end