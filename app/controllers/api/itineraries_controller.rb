# app/controllers/api/itineraries_controller.rb
module Api
    class ItinerariesController < ApplicationController
      before_action :set_itinerary, only: [:show, :update, :destroy]
  
      # GET /api/itineraries
      def index
        @itineraries = Itinerary.includes(paths: [:deliveries, :collections]).all
        render json: @itineraries, include: { paths: { include: [:deliveries, :collections] } }
      end
  
      # GET /api/itineraries/:id
      def show
        @itinerary = Itinerary.includes(paths: [:deliveries, :collections]).find(params[:id])
        render json: @itinerary.as_json(include: { paths: { include: [:deliveries, :collections] } })
      end
  
      # POST /api/itineraries
      def create
        @itinerary = Itinerary.new(itinerary_params)
        if @itinerary.save
          render json: @itinerary, status: :created
        else
          render json: @itinerary.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/itineraries/:id
      def update
        if @itinerary.update(itinerary_params)
          render json: @itinerary
        else
          render json: @itinerary.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/itineraries/:id
      def destroy
        @itinerary.destroy
        head :no_content
      end
  
      private
  
      def set_itinerary
        @itinerary = Itinerary.find(params[:id])
      end
  
      def itinerary_params
        params.require(:itinerary).permit(:driver)
      end
    end
  end
  