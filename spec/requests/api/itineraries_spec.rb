# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Itineraries', type: :request do
  describe 'GET /api/itineraries' do
    it 'returns a list of itineraries in JSON format' do
      itinerary1 = Itinerary.create(driver: 'John Doe')
      itinerary2 = Itinerary.create(driver: 'Jane Smith')

      get '/api/itineraries'

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['driver']).to eq(itinerary1.driver)
      expect(json_response[1]['driver']).to eq(itinerary2.driver)
    end
  end
end
