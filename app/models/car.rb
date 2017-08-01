class Car < ApplicationRecord
  belongs_to :user
  has_many :service_milestones
  has_many :services, through: :service_milestones

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
    car.build_service_schedules
  end

  def get_service_schedule
    EdmundsService.new.maintenance_schedule_lookup(self)
  end

  def build_service_schedules
    services = get_service_schedule
    service_milestones = {}

    services[:actionHolder].each do |service|
      mileage = service[:intervalMileage]
      until mileage > 200000
        if service_milestones[mileage]
          service_milestones[mileage] << service
        else
          service_milestones[mileage] = [service]
        end
        mileage += mileage
      end
    end

    create_service_milestones(service_milestones)
  end

  def create_service_milestones(milestones)
    milestones.each do |milestone|
      ServiceMilestone.from_edmunds(milestone, self)
    end
  end
end
