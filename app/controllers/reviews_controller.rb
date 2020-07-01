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
    @receiver = User.find(params[:profile_id])
    @review = Review.new(review_params)
    @review.receiver = @receiver
    @review.reviewer = current_user
    if @review.save
      redirect_to profile_path(@receiver)
    else
      render :reviews_button
    end
  end

  private

  def review_params
    params.require(:review).permit(:user, :profile_id, :receiver, :reviewer, :content, :rating)
  end
end
