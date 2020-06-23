class Chatroom < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :users, through: :flats
end
