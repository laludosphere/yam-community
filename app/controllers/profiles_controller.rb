class ProfilesController < ApplicationController
  def index
  @users
  end

  def show
    @current_user
  end
end
