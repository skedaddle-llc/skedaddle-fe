class Itinerary < ApplicationRecord
validates_presence_of :search, :parks, :restaurants
belongs_to :user
end
