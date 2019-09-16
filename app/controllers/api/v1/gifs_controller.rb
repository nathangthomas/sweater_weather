class Api::V1::GifsController < ApplicationController

  def index
   render json: Gif.all
  end

private

#add search params for locaton to controller to allow user to search by location

end
