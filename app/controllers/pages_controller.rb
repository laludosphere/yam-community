class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :home
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
    redirect_to root_path
  end
end
