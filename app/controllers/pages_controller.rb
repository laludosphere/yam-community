class PagesController < ApplicationController
  def home
    if params[:query].present?
      @flats = Flat.near(params[:query], 10).limit(3)
    end
  end

  def dashboard
    filter_flats
  end

  def search
    if params[:query].present?
      @flats = Flat.near(params[:query], 10)
    else
      @flats = Flat.all
    end
    # raise
    redirect_to root_path
  end

  def filter_flats
    @preference = current_user.preference
    @flats = Flat.where(flat_type: @preference.flat_type)
  end
end
