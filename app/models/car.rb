class Car < ActiveRecord::Base
  has_many :reservations
  has_many :drivers, through: :reservations
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