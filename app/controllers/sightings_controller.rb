class SightingsController < ApplicationController
    def index
        @sightings = Sighting.all
    end
    
    def show 
        @sighting = Sighting.find(params[:id])
    end 
    
    def new 
        @sighting = Sighting.new
    end 
    
    def create 
        @region = Region.find_by(params[:id])
        @animal = Animal.find_by(params[:id])
        @sighting = Sighting.create(sighting_params)

        if @sighting.save
            flash[:success] = "New Sighting successfully created!"
            redirect_to sighting_path(@sighting)
        else 
            flash.now[:error] = "New Sighting creation failed!"
            render :new 
        end 
    end 
    
    def edit 
        @sighting = Sighting.find(params[:id])
    end 
    
    def update 
        @sighting = Sighting.find(params[:id])
    
        if @sighting.update(sighting_params)
          redirect_to @sighting 
        else 
          render :edit 
        end 
    end 
    
    def destroy 
        @sighting = Sighting.find(params[:id])
        @sighting.destroy 
    
        redirect_to root_path
    end 

    def new_search
    end 

    def search_date
        @sightings = Sighting.where("created_at LIKE ?", params[:search_by_date])
    end 
    
    private 
    def sighting_params 
      params.require(:sighting).permit( :long, :longs, :lat, :lats, :animal_id, :region_id)
    end 
end
