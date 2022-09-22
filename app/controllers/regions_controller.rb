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

    def search_region
        @animals = Animal.joins(:region).where("regions.region LIKE ?", params[:search_by_region])
    end 
    
    private 
    def region_params
        params.require(:region).permit(:region)
    end 
end
