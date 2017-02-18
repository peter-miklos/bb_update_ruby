require './lib/bike_container.rb'

class Garage
  include BikeContainer

  def repair_bike(bike)
    @bikes[@bikes.index(bike)].repair_bike
  end
  
end
