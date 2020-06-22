class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :city
      t.string :flat_type
      t.integer :price_per_month
      t.date :available_at
      t.integer :surface_area
      t.references :user, null: false, foreign_key: true
      t.integer :zip_code
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
