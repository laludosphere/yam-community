class PremiumSubscriptionsController < ApplicationController
  def index
    @premium_subscriptions = policy_scope(PremiumSubscription)
  end

  def show
    @premium_subscription = PremiumSubscription.find(params[:id])
    authorize @premium_subscription
  end

   private

  def premium_subscription_params
    params.require(:premium_subscription).permit(:name, :category_id, :photo_url, :sku)
  end
end
