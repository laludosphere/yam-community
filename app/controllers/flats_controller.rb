class FlatsController < ApplicationController
  before_action :authenticate_user!

  def index
    # filter_flats
    @preference = current_user.preference
    raise
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flat_path(@flat)
  end

  def filter_flats
    @preference = current_user.preference
    @flats = Flat.where(flat_type: @preference.flat_type)
  end

  private

  def flat_params
    params.require(:flat).permit(:user, :photos)
  end
end
