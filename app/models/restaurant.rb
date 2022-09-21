# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates_presence_of :name,
                        :rating,
                        :price,
                        :image_url,
                        :url,
                        :categories,
                        :address,
                        :phone
  belongs_to :itinerary
end
