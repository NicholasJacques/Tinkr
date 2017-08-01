class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :cylinders
      t.string :displacement
      t.string :fuel_type
      t.string :transmission
      t.string :speeds
      t.string :model_year_id

      t.timestamps
    end
  end
end
