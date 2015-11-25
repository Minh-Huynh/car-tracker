class ReservationsController < ApplicationController


  def create
    @cars = Car.all
    time = params[:reservation]
    @start = DateTime.new(time["reserved_from(1i)"].to_i, time["reserved_from(2i)"].to_i,time["reserved_from(3i)"].to_i,time["reserved_from(4i)"].to_i,time["reserved_from(5i)"].to_i)
    @end = DateTime.new(time["reserved_to(1i)"].to_i, time["reserved_to(2i)"].to_i,time["reserved_to(3i)"].to_i,time["reserved_to(4i)"].to_i,time["reserved_to(5i)"].to_i)
    @reservation = Reservation.new(reserved_from: @start, reserved_to: @end, car_id: params[:car_id], driver_id:2 )
    if @reservation.save
      flash[:notice] = "You have successfully reserved the vehicle"  
      redirect_to root_path
    else
      flash.now[:error] = "There were errors"
      render "cars/index"
    end
  end

end