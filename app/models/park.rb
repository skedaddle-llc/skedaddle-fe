class Park < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :country,
                        :description,
                        :directions,
                        :lat,
                        :lon,
                        :activities
  belongs_to :itinerary
end