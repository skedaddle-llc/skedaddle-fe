# frozen_string_literal: true

class Park < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :country,
                        :description,
                        :directions,
                        :lat,
                        :lon,
                        :activities,
                        :url
  belongs_to :itinerary
end
