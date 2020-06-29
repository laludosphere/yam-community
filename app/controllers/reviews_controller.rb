class ReviewsController < ApplicationController
  before_action :skip_authorization

  def index
    @reviews = policy_scope(Review).where(receiver_id: params[:profile_id]) # destiné au current_user

    # @reviews = Review.where(receiver_id: params[:profile_id])
  end

  def new

    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to profile_reviews_path(@review)
    else
      render 'new'
    end
  end
end
