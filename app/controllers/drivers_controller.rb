class DriversController < ApplicationController

  def edit
    @current_user = current_user
  end

  def update
    @current_user = Driver.find(params[:id])
    if @current_user.update(driver_params)
      flash[:notice] = "User Updated"
      redirect_to root_path
    else
      render 'edit'
    end

  end

  private
  def driver_params
    params.require(:driver).permit!
  end

end