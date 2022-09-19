class AddItineraryToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :itinerary, foreign_key: true
  end
end
