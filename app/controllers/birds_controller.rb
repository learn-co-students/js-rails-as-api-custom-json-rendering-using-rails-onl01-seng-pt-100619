class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds

    # render json: birds, only: [:id, :name, :species]
    # rails has the only syntax that works with nested information

    # render json: birds, except: [:created_at, :updated_at]
    # or just exclue the fields we dont need

    render json: birds.to_json(except: [:created_at, :updated_at])
    #  these are parameters of the to_json method
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # we can acces the attributes of the ruby object and  only send that info
    if bird
      render json: bird.slice(:id, :name, :species)
    # or use the slice method with the desired attributes passed into slice wont work with embedded hashes in an array
    else 
      render json: {message: 'Bird not found'}
    end # send a custom error or response so a general http error is not sent

  end # we can filter the information from the database by view
end