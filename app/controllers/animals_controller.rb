class AnimalsController < ApplicationController
    def index
        @animals = Animal.all 
    end
    
    def show 
        @animal = Animal.find(params[:id])
    end 
    
    def new 
        @animal = Animal.new
      end 
    
      def create
        @animal = Animal.new(animal_params)
    
        if @animal.save 
          flash[:success] = "New Animal successfully created!"
          redirect_to animal_path(@animal)
        else 
          flash.now[:error] = "New Animal creation failed!"
          render :new 
        end  
      end
    
    def edit 
        @animal = Animal.find(params[:id])
    end 
    
    def update 
        @animal = Animal.find(params[:id])
    
        if @animal.update(animal_params)
          redirect_to @animal 
        else 
          render :edit 
        end 
    end 
    
    def destroy 
        @animal = Animal.find(params[:id])
        @animal.destroy
        
        redirect_to root_path 
    end 
    
    private 
    def animal_params 
      params.require(:animal).permit(:name, :animal_id, :region_id)
    end 
end
