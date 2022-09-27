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
    @animal = Animal.find_or_create_by(animal_params)
    
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

  def new_sighting 
    @animal = Animal.find(params[:id])
  end 

  def create_sighting 
    @animal = Animal.find(params[:id])
    @region = Region.find(params[:region_id])
    @sighting = Sighting.new(region: @region, animal: @animal, long: long, lat: lat, longs: longs, lats: lats)

    if @sighting.save
      flash[:success] = "New Sighting successfully created!"
      redirect_to sighting_path(@sighting)
    else 
      flash.now[:error] = "New Sighting creation failed!"
      render :new_sighting
    end 
  end 
    
  private 
  def animal_params 
    params.require(:animal).permit(:name, :animal_id)
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
