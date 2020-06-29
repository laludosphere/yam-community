class ProfilesController < ApplicationController
  before_action :skip_authorization
  def index
    @users = User.all
  end

  def show

  end

  def my_profile
    @current_user
    @last_review = Review.where(receiver_id: current_user).last
    @reviewer = User.find(@last_review.reviewer_id)
    @preference = current_user.preference
  end
end
