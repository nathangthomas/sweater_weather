class CoordinatesFacade

def initialize(location)
  @location = location
end
  def coordinates
    coordinates_service.find_coordinates
  end

  private
  def service
    @_service ||= CoordinatesService.new(@location)
  end
end
