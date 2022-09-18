class ItinerariesController < ApplicationController

  def new
    @search = itinerary_params[:search]
    @parks = ParksService.parks_near(@search)
    @restaurants = RestaurantsService.restaurants_near(@search)
  end

  # def create
  #   itinerary = Itinerary.new(itinerary_params)
  #   if itinerary.save
  #     flash[:success] = "New itinerary saved."
  #     redirect_to itinerary_path(itinerary.id)
  #   else
  #     flash[:error] = itinerary.errors.full_messages.uniq * ', '
  #     redirect_to root
  #   end
  # end

  # def show
  #   @itinerary = find_itinerary
  #   # @itineraries = user.itineraries ?
  # end

  # def destroy
  #   find_itinerary.destroy!
  # end

  private

  def itinerary_params
    params.permit(:search, :parks, :restaurants)
  end

  # def find_itinerary
  #   Itinerary.find(params[:id])
  # end
end