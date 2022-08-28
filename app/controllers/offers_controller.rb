class OffersController < ApplicationController

  def index
    if params[:query].present? && Offer.search_by_location(params[:query]).size > 0
      @offers = Offer.search_by_location(params[:query])
    else
      @offers = Offer.all
    end
    # if params[:query].present?
    #   raise
    #   @offers = Offer.where("location ILIKE ?", "%#{params[:query]}%")
    # else
    #   @offers = Offer.all
    # end

    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end
  end

  def my_offers
    @user = current_user.id
    @offers = Offer.where(user_id: @user)
  end

  def show
    @offer = Offer.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    if @offer.save
      redirect_to my_offers_path
    else
      render 'offers/new', status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params) # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to my_offers_path
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to my_offers_path, status: :see_other
  end

  def my_offers_show
    show
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :location, :price_per_night, photos: [])
  end

end
