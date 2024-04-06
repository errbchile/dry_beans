# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Collections', type: :request do
  describe 'GET /api/itineraries/:itinerary_id/paths/:path_id/collections' do
    it 'returns a list of collections for a specific path in JSON format' do
      itinerary = Itinerary.create(driver: 'John Doe')
      path = Path.create(itinerary:, departure: 'Location A', arrival: 'Location B')
      collection1 = Collection.create(path:, product: 'product1', client: 'client1')
      collection2 = Collection.create(path:, product: 'product2', client: 'client2')

      get "/api/itineraries/#{itinerary.id}/paths/#{path.id}/collections"

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['product']).to eq(collection1.product)
      expect(json_response[1]['product']).to eq(collection2.product)
      expect(json_response[0]['client']).to eq(collection1.client)
      expect(json_response[1]['client']).to eq(collection2.client)
    end
  end

  describe 'GET /api/itineraries/:itinerary_id/paths/:path_id/collections/:id' do
    it 'returns a single collection for a specific path in JSON format' do
      itinerary = Itinerary.create(driver: 'John Doe')
      path = Path.create(itinerary:, departure: 'Location A', arrival: 'Location B')
      collection = Collection.create(path:, product: 'product', client: 'client')

      get "/api/itineraries/#{itinerary.id}/paths/#{path.id}/collections/#{collection.id}"

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response['product']).to eq(collection.product)
      expect(json_response['client']).to eq(collection.client)
    end
  end
end
