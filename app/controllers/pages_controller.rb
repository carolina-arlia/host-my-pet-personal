class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @offer = Offer.last
    @offers = Offer.first(3)
    # @offers = Offer.search_by_location(params[:query])
  end
end
