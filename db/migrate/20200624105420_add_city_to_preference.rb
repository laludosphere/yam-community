class AddCityToPreference < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :city, :string
  end
end
