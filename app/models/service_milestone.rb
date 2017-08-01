class ServiceMilestone < ApplicationRecord
  belongs_to :car
  has_many :services

  def self.from_edmunds(milestone_data, car)
    milestone = ServiceMilestone.new
    milestone.attributes = {
      mileage: milestone_data[0],
      car: car
    }
    milestone.save

    milestone_data[1].each do |service|
      Service.build_service(service, milestone)
    end
  end
end
