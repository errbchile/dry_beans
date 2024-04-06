# frozen_string_literal: true

# app/controllers/api/deliveries_controller.rb

module Api
  class DeliveriesController < ApplicationController
    before_action :set_path
    before_action :set_delivery, only: %i[show update destroy]

    # GET /api/itineraries/:itinerary_id/paths/:path_id/deliveries
    def index
      @deliveries = @path.deliveries.includes(path: :itinerary)
      render json: @deliveries, include: { path: { include: :itinerary } }
    end

    # GET /api/itineraries/:itinerary_id/paths/:path_id/deliveries/:id
    def show
      render json: @delivery, include: { path: { include: :itinerary } }
    end

    # POST /api/itineraries/:itinerary_id/paths/:path_id/deliveries
    def create
      @delivery = @path.deliveries.new(delivery_params)

      if @delivery.save
        render json: @delivery, status: :created
      else
        render json: @delivery.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/itineraries/:itinerary_id/paths/:path_id/deliveries/:id
    def update
      if @delivery.update(delivery_params)
        render json: @delivery
      else
        render json: @delivery.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/itineraries/:itinerary_id/paths/:path_id/deliveries/:id
    def destroy
      @delivery.destroy
    end

    private

    def set_path
      @path = Path.find(params[:path_id])
    end

    def set_delivery
      @delivery = @path.deliveries.find(params[:id])
    end

    def delivery_params
      params.require(:delivery).permit(:client, :product)
    end
  end
end
