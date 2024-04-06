# frozen_string_literal: true

# app/controllers/api/collections_controller.rb

module Api
    class CollectionsController < ApplicationController
      before_action :set_path
      before_action :set_collection, only: %i[show update destroy]
  
      # GET /api/itineraries/:itinerary_id/paths/:path_id/collections
      def index
        @collections = @path.collections.includes(path: :itinerary)
        render json: @collections, include: { path: { include: :itinerary } }
      end
  
      # GET /api/itineraries/:itinerary_id/paths/:path_id/collections/:id
      def show
        render json: @collection, include: { path: { include: :itinerary } }
      end
  
      # POST /api/itineraries/:itinerary_id/paths/:path_id/collections
      def create
        @collection = @path.collections.new(collection_params)
  
        if @collection.save
          render json: @collection, status: :created
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/itineraries/:itinerary_id/paths/:path_id/collections/:id
      def update
        if @collection.update(collection_params)
          render json: @collection
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/itineraries/:itinerary_id/paths/:path_id/collections/:id
      def destroy
        @collection.destroy
        head :no_content
      end
  
      private
  
      def set_path
        @path = Path.find(params[:path_id])
      end
  
      def set_collection
        @collection = @path.collections.find(params[:id])
      end
  
      def collection_params
        params.require(:collection).permit(:name, :description)
      end
    end
  end
  