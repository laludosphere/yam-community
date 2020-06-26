class ProfilesController < ApplicationController
  before_action :skip_authorization
  def index
  @users = User.all
  end

  def show
    @current_user
    @last_review = Review.where(receiver_id: current_user).last
    @reviewer = User.find(@last_review.reviewer_id)
  end
end
