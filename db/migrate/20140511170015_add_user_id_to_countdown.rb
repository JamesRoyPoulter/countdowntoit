class AddUserIdToCountdown < ActiveRecord::Migration
  def change
    add_column :countdowns, :user_id, :integer
  end
end
