class ReservationsController < ApplicationController
  before_action :require_user

  def create
    @cars = Car.all
    time = params[:reservation]
    @date_format_error = false
    if !valid_date?(time[:reserved_from]) || !valid_date?(time[:reserved_to])
      @reservation = Reservation.new(car_id: params[:car_id], driver_id: params[:driver_id])
      @reservation.errors.add(:time, "Date format error")
      render "cars/index"
      return
    end
    @start = Time.strptime(time[:reserved_from],'%m/%d/%Y %I:%M %p')
    @end = Time.strptime(time[:reserved_to],'%m/%d/%Y %I:%M %p')
    @reservation = Reservation.new(reserved_from: @start, reserved_to: @end, car_id: params[:car_id], driver_id:current_user.id )
    if @reservation.save
      flash[:notice] = "You have successfully reserved the vehicle"  
      redirect_to root_path
    else
      flash.now[:error] = "There were errors"
      render "cars/index"
    end
  end

  def destroy
    current_reservation = Car.find(params[:car_id]).current_reservation
    if current_reservation && current_user === current_reservation.driver
      current_reservation.delete
      flash[:notice] = "Car returned"
      redirect_to :back
    else
      flash[:error] = "You can't delete a reservation that isn't yours"
      redirect_to :back
    end
  end

  private

  def valid_date?(str)
    /^\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2} (AM|PM)$/ =~ str
  end
end