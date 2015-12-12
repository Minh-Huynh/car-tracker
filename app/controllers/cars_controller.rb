class CarsController < ApplicationController
  before_action :require_user
  
  def index
    @cars = Car.all
    @reservation = Reservation.new
    @notification = Notification.new
    render :index
  end

  def show

  end

  def new
    @car = Car.new

  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "New Vehicle Created"
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
    @car = Car.find(params[:id])

  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      flash[:notice]="Successful Update"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @car = Car.find(params[:id]).destroy
    flash[:notice] = "Vehicle Deleted"
    redirect_to root_path


  end

  private
  def car_params
      params.require(:car).permit!
  end

end