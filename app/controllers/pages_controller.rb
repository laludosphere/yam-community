class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :home

  def home
    if params[:query].present?
      @flats = Flat.near(params[:query], 10).limit(3)
    end
  end

  def dashboard
    filter_flats
  end

  def premium
  end

  def subscribe_premium
  end

  def search
    if params[:query].present?
      @flats = Flat.near(params[:query], 10)
    else
      @flats = Flat.all
    end
    redirect_to root_path
  end

  def filter_flats
    @preference = current_user.preference
    @flats = Flat.where(flat_type: @preference.flat_type)
  end
end
