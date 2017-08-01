class GarageController < ApplicationController

  def create
    redirect_to garage_index_path
  end

  def index
    @cars = current_user.cars
  end

end
