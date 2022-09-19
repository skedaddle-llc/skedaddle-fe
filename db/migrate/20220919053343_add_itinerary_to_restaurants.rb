class AddItineraryToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :itinerary, foreign_key: true
  end
end
