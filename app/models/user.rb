class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chatrooms, dependent: :destroy
  has_one :preference, dependent: :destroy
  has_many :flats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many_attached :photos
  has_many :orders

  def received_reviews
    Review.where(receiver_id: self.id)
  end

  def reviewers
    Review.where(reviewer_id: self.id)
  end
  def average_ratings
    rating = 0
    receive_reviews = self.received_reviews
    receive_reviews.each do |review|
      rating += review.rating
      puts rating
    end
    rating /= receive_reviews.length
  end
end
