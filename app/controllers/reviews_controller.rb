class ReviewsController < ApplicationController
  before_action :skip_authorization

  def index
    @reviews = policy_scope(Review).where(receiver_id: params[:profile_id]) # destiné au current_user
    # @reviews = Review.where(receiver_id: params[:profile_id])
  end

  def new
    @review = Review.new
    @receiver = User.find(params[:profile_id])
    @review.receiver = @receiver
    @reviewer = current_user
  end

  def create
  end

  private

  def review_params
    params.require(:review).permit(:user, :profile_id, :receiver, :reviewer)
  end
end
