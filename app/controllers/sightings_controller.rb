class SightingsController < ApplicationController
  
  def index 
    sightings = Sighting.all
    render json: 
    SightingSerializer.new(sighting)
  end 
  
  def show
    sighting = Sighting.find(params[:id])
    options = {
      include: [:bird, :location]
    } 
    #  the recommended method is to pass in a second options parameter to the serializer 
    # indicating that we want to include those objects:
    render json: 
    SightingSerializer.new(sighting, options)
  end
end
