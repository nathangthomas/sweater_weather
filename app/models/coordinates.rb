class Coordinates
  attr_reader :coordinates
  def initialize(data)
    @coordinates = WeatherFacade.coordinates
  end
end


# @coordinates = WeatherFacade.coordinates data[1][0][:geometry][:location].values.join(",")
