class FlatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @preferences = current_user.preferences
    @flats = Flat.all
    raise
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

  private

  def flat_params
    params.require(:flat).permit(:user)
  end
end
