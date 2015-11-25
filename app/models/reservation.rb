class Reservation < ActiveRecord::Base
belongs_to :car
belongs_to :driver
validate :return_before_pickup_time, :conflict

  def return_before_pickup_time
    if self.reserved_to < self.reserved_from
      errors.add(:time, "Return date/time cannot be before Pickup date/time")
    end
  end

  def conflict
    Reservation.where("car_id = #{self.car_id}").each_with_index do |existing,index|
      if (self.reserved_from - existing.reserved_to)*(existing.reserved_from-self.reserved_to)>= 0
        errors.add(:time, "Schedule conflict: #{existing.driver.name} from: #{existing.reserved_from} to: #{existing.reserved_to}")
      end
    end
  end

end



