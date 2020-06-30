class Order < ApplicationRecord
  belongs_to :user
  belongs_to :premium_subscription
  monetize :amount_cents
end
