class RegionsController < ApplicationController
    def index
        @regions = Region.all
    end
    
    def show 
        @region = Region.find(params[:id])
    end 
    
    def new 
        @region = Region.new
    end 
    
    def create 
        @region = Region.new(region_params)
    
        if @region.save
            flash[:success] = "New Region successfully created!"
            redirect_to @region 
        else 
            flash.now[:error] = "New Region creation failed!"
            render :new 
        end 
    end 
    
    def edit 
        @region = Region.find(params[:id])
    end 
    
    def update 
        @region = Region.find(params[:id])
    
        if @region.update(region_params)
            redirect_to @region
        else 
            render :edit 
        end 
    end 
    
    def destroy 
        @region = Region.find(params[:id])
        @region.destroy
    
        redirect_to root_path
    end

    def new_sighting
        @region = Region.find(params[:id])
    end 
    
    def create_sighting 
        @region = Region.find(params[:id])
        @animal = Animal.find(params[:animal_id])
        @sighting = Sighting.new(region: @region, animal: @animal, long: long, lat: lat, longs: longs, lats: lats)
    
        if @sighting.save
            flash[:success] = "New Sighting successfully created!"
            redirect_to sighting_path(@sighting)
        else 
            flash.now[:error] = "New Sighting creation failed!"
            render :new_sighting
        end 
    end 

    def search_region
        @animals = Animal.joins(:region).where("regions.region LIKE ?", params[:search_by_region])
    end 
    
    private 
    def region_params
        params.require(:region).permit(:region)
    end 

    def long
        params[:long]
    end 

    def longs
        params[:longs]
    end 

    def lat
        params[:lat]
    end 

    def lats
        params[:lats]
    end 
end
