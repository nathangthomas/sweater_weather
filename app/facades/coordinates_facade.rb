class CoordinatesFacade

  def coordinates
    @_coordinates ||= service.coordinates_data.map {|data|
      Coordinates.new(data[1][0][:geometry][:location].values.join(","))}
  end

  private

  def service
    @_service ||= GoogleMapsService.new
  end

  def coordinates_data
    @_coordinates_data ||= service.coordinates_data
  end
end
