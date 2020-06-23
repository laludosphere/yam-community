class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chatrooms, dependent: :destroy
  has_many :preferences, dependent: :destroy
  has_many :flats, dependent: :destroy
  has_many :messages, dependent: :destroy

  def received_reviews
    Review.where(receiver_id: self.id)
  end

  def reviewers
    Review.where(reviewer_id: self.id)
  end
end
