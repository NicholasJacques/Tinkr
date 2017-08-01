class ChangeMileageColumnOnServiceMilestonesToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :service_milestones, :mileage, 'integer USING mileage::integer'
  end
end
