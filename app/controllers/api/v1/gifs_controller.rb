class Api::V1::GifsController < ApplicationController

  def index
   render json: GifSerializer.new(Gif.all)
  end

private

#add search params for locaton to controller to allow user to search by location

end
