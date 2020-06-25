class ProfilesController < ApplicationController
  def index
  @users = User.all
  end

  def show
    @current_user
    @last_review = Review.where(receiver_id: current_user).last
  end

end
