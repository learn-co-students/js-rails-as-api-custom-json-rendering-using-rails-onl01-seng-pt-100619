class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    render json: birds, only: [:id, :name, :species]
    # The only and except keywords are actually parameters of the to_json method, obscured by that magic. 
    # The last code snippet can be rewritten in full to show what is actually happening:
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: { id: bird.id, name: bird.name, species: bird.species }

    if bird
      render json: bird.slice(:id, :name, :species)
    else 
      render json: {message: 'Bird not found'}
    end
  end
end