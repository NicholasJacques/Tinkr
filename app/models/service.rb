class Service < ApplicationRecord
  belongs_to :service_milestone
  delegate :car, to: :service_milestone, allow_nil: false

  def self.build_service(service_data, milestone)
    service = Service.new

    service.attributes = {
      item: service_data[:item],
      item_description: service_data[:itemDescription],
      action: service_data[:action],
      interval_mileage: service_data[:intervalMileage],
      service_milestone: milestone
    }

    service.save
  end
end
