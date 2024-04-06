# app/controllers/api/paths_controller.rb
module Api
    class PathsController < ApplicationController
      before_action :set_path, only: [:show, :update, :destroy]
  
      # GET /api/itineraries/:itinerary_id/paths
      def index
        @itinerary = Itinerary.find(params[:itinerary_id])
        @paths = @itinerary.paths.includes(:deliveries, :collections)
        render json: @paths.as_json(include: { 
          itinerary: {}, 
          deliveries: {}, 
          collections: {}
        })
      end
  
      # GET /api/itineraries/:itinerary_id/paths/:id
      def show
        render json: @path.as_json(include: { 
          itinerary: {}, 
          deliveries: {}, 
          collections: {}
        })
      end
  
      # POST /api/itineraries/:itinerary_id/paths
      def create
        @path = Path.new(path_params)
        @path.itinerary_id = params[:itinerary_id]
  
        if @path.save
          render json: @path, status: :created
        else
          render json: @path.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/itineraries/:itinerary_id/paths/:id
      def update
        if @path.update(path_params)
          render json: @path
        else
          render json: @path.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/itineraries/:itinerary_id/paths/:id
      def destroy
        @path.destroy
        head :no_content
      end
  
      private
        def set_path
            @path = Path.includes(:itinerary, :deliveries, :collections).find(params[:id])
        end
  
        def path_params
          params.require(:path).permit(:departure, :arrival)
        end
    end
end
  