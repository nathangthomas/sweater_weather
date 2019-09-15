class Coordinates < ApplicationRecord
  validates_presence_of :latitude, :langitude
end

#
# class Coordinates
#   attr_reader :latitude, :longitude
#
#   def initialize(data)
#     binding.pry
#     @latitude = data[1][0][:geometry][:location][:lat]
#     @longitude = data[1][0][:geometry][:location][:lng]
#   end
# end
