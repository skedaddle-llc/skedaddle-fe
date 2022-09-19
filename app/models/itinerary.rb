class Itinerary < ApplicationRecord
validates_presence_of :search
belongs_to :user
has_many :parks, dependent: :destroy
has_many :restaurants, dependent: :destroy
end
