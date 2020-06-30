class PreferencesController < ApplicationController
  before_action :skip_authorization

  def update
    @preference = current_user.preference

    if @preference.update(preference_params)
      redirect_to profile_my_profile_path(current_user), notice: 'Vos préférences sont enregistrées  😎'
    else
      @last_review = Review.where(receiver_id: current_user).last
      @reviewer = User.find(@last_review.reviewer_id)
      @preference = current_user.preference
      render 'profiles/my_profile'
    end
  end

  private

  def preference_params
    params.require(:preference).permit(
      :user,
      :profile_id,
      :price_per_month,
      :roomates,
      :surface_area,
      :school_location,
      :surrounding_area,
      :active,
      :moving_at,
      :school_latitude,
      :school_longitude,
      :city,
      :name,
      :flat_type
    )
  end
end
