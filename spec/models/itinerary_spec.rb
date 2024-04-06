# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  describe 'associations' do
    it 'has many paths' do
      itinerary = Itinerary.create(driver: 'Test Itinerary')
      path1 = itinerary.paths.create(departure: 'Path 1', arrival: 'Path 1')
      path2 = itinerary.paths.create(departure: 'Path 2', arrival: 'Path 2')

      expect(itinerary.paths.count).to eq(2)
      expect(itinerary.paths).to include(path1)
      expect(itinerary.paths).to include(path2)
    end
  end
end
