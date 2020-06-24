class AddStatusVerifiedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status_verified, :boolean, :default => false
  end
end
