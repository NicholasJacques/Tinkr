class Api::V1::GarageController < ApplicationController
  def create
    cars = params[:cars]
    edmunds_service = EdmundsService.new
    if cars.each do |car|
         car_data = edmunds_service.vin_lookup(car)
         Car.fromEdmunds(car_data, current_user)
       end
      current_user.update_attributes(account_completed?: true)
      head 200
    else
      head 400
    end
  end
end
