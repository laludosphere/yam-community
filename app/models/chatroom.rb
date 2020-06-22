class Chatroom < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :messages
  has_many :users, through: :flats
end
