class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #use 'only' to permit the passed in keys to the render, cannot use slice as that only works for singular hash
    render json: birds, only: [:id, :name, :species]
  end

  def index
    birds = Bird.all
    #use 'except' to omit the keys we do not want passed to the render. "all keys except" 
    render json: birds, except: [:created_at, :updated_at]
  end

  def index
    birds = Bird.all
    #same as above minus hte rails magic. 
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # specifying what data we want to render via JSON omitting 'created_at' & 'updated_at'
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else # if record not found bird == nil. Allows for customer error handling 
      render json: { message: 'Bird not found' }
    end
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #using slice to create a new hash based on keys passed into slice
    render json: bird.slice(:id, :name, :species)
  end

end