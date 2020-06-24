class Flat < ApplicationRecord
  belongs_to :user
  has_one :flat

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_address_and_city,
    against: [:address, :city],
    using: {
      tsearch: { prefix: true }
    }
  def full_address
    return "#{self.address}, #{self.city}"
  end
end
