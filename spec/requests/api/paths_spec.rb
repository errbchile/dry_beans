# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Paths', type: :request do
  describe 'GET /api/itineraries/:itinerary_id/paths' do
    it 'returns a list of paths for a specific itinerary in JSON format' do
      itinerary = Itinerary.create(driver: 'John Doe')
      path1 = Path.create(itinerary:, departure: 'Location A', arrival: 'Location B')
      path2 = Path.create(itinerary:, departure: 'Location C', arrival: 'Location D')

      get "/api/itineraries/#{itinerary.id}/paths"

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['departure']).to eq(path1.departure)
      expect(json_response[1]['departure']).to eq(path2.departure)
    end
  end

  describe 'GET /api/itineraries/:itinerary_id/paths/:id' do
    it 'returns a single path for a specific itinerary in JSON format' do
      itinerary = Itinerary.create(driver: 'John Doe')
      path = Path.create(itinerary:, departure: 'Location A', arrival: 'Location B')

      get "/api/itineraries/#{itinerary.id}/paths/#{path.id}"

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['departure']).to eq(path.departure)
      expect(json_response['arrival']).to eq(path.arrival)
    end
  end
end
