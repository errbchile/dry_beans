class AddItineraryIdToPaths < ActiveRecord::Migration[7.1]
  def change
    add_reference :paths, :itinerary, foreign_key: true
  end
end
