class PaymentsController < ApplicationController
  before_action :skip_authorization

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
