class CarsController < ApplicationController
  def index
    @cars = Car.all
    @reservation = Reservation.new
    render :index
  end

  def show

  end

  def new

  end

  def create
    binding.pry

  end

  def edit

  end

  def update

  end

  def destroy

  end

end