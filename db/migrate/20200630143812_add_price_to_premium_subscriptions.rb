class AddPriceToPremiumSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_monetize :premium_subscriptions, :price, currency: { present: false }
  end
end
