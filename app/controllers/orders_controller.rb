class OrdersController < ApplicationController
  before_action :skip_authorization

  def create
  premium_subscription = PremiumSubscription.find(params[:premium_subscription_id])
  order = Order.create!(premium_subscription: premium_subscription, premium_subscription_sku: premium_subscription.sku, amount: premium_subscription.price_cents, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: premium_subscription.sku,
      images: [premium_subscription.photo_url],
      amount: premium_subscription.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
  @order = current_user.orders.find(params[:id])
  end
end
