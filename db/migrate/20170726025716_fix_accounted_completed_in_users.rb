class FixAccountedCompletedInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :accounted_completed?
    add_column :users, :account_completed?, :boolean, default: :false
  end
end
