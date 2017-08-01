class AddAccountCompletedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :accounted_completed?, :boolean, default: :false
  end
end
