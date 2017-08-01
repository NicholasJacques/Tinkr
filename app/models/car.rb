class Car < ApplicationRecord
  belongs_to :user

  def self.fromEdmunds(car_data, user)
    car = Car.new
    car.attributes = {
      make: car_data[:make][:name],
      model: car_data[:model][:name],
      year: car_data[:years].first[:year],
      cylinders: car_data[:engine][:cylinder],
      displacement: car_data[:engine][:size],
      fuel_type: car_data[:engine][:type],
      transmission: car_data[:transmission][:transmissionType],
      speeds: car_data[:transmission][:numberOfSpeeds],
      model_year_id: car_data[:years].first[:id],
      user: user
    }
    car.save
  end

end
