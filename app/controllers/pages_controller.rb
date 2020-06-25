class PagesController < ApplicationController
  def home
  end

  def dashboard
  end

  def search
    if params[:query].present?
      @flats = Flat.near(params[:query], 10)
    else
      @flats = Flat.all
    end
    raise
    redirect_to root_path
  end
end
