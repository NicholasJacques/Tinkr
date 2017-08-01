class CreateServiceMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :service_milestones do |t|
      t.string :mileage
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
