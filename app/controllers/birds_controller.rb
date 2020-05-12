class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # 1) This render all attributes of the json file
    # render json: birds
    # 2) This render only id, name, and species
    # render json: birds, only: [:id, :name, :species]
    # 3) This achieve the same as number 2
    # render json: birds, except: [:created_at, :updated_at]
    # 4) except and only are parameter of to_json method:
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # The slice method achieve the same thing
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: "Bird not found"}
    end
  end
  
end