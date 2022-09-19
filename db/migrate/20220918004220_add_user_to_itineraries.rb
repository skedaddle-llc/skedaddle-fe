class AddUserToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_reference :itineraries, :user, foreign_key: true
  end
end
