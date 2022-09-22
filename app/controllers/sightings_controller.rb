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
        @sighting = Sighting.create!(sighting_params)
    
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

    def search_date 
        @sightings = Sighting.where("date LIKE ?", params[:search_by_date])
    end 
    
    private 
    def sighting_params 
      params.require(:sighting).permit(:date, :long, :longs, :lat, :lats, :sighting_id, :animal_id)
    end 
end
