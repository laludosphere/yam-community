class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.string :flat_type
      t.integer :price_per_month
      t.integer :roomates
      t.integer :surface_area
      t.string :school_location
      t.integer :surrounding_area
      t.boolean :active
      t.references :user, null: false, foreign_key: true
      t.date :moving_at
      t.float :school_latitude
      t.float :school_longitude

      t.timestamps
    end
  end
end
