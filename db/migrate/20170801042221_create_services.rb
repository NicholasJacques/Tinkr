class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :item
      t.string :item_description
      t.string :action
      t.string :interval_mileage
      t.references :service_milestone, foreign_key: true

      t.timestamps
    end
  end
end
