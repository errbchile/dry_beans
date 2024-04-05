class Path < ApplicationRecord
    belongs_to :itinerary
    has_many :deliveries
    has_many :collections
end
