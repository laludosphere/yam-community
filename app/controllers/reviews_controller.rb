class ReviewsController < ApplicationController
  before_action :skip_authorization

  def index
    @reviews = Review.where(receiver_id: params[:profile_id])
    raise
  end

  def new
    @review =
    @flat = Flat.find(params[:flat_id])

    @review = current_user
    raise
  end

  def create
  end
end
