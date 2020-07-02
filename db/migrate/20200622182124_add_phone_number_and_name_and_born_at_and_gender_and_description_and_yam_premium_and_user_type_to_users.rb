class AddPhoneNumberAndNameAndBornAtAndGenderAndDescriptionAndYamPremiumAndUserTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :name, :string
    add_column :users, :born_at, :date
    add_column :users, :gender, :string
    add_column :users, :description, :text
    add_column :users, :yam_premium, :boolean
    add_column :users, :user_type, :string
  end
end
