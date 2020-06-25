class FlatsController < ApplicationController
  before_action :authenticate_user!

  def index
    filter_flats
    @preference = current_user.preference
    # @flats = Flat.all
    @flats = policy_scope(Flat)
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    # @flat = Flat.new(flat_params)
    # @flat.user = current_user
    @flat = current_user.flats.build(flat_params)
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat), notice: 'Flat was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @flat = Flat.find(params[:id])

    authorize @flat

    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    authorize @flat
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
