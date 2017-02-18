require "./lib/bike.rb"
require "./lib/bike_container.rb"

class DockingStation
  include BikeContainer

  def release_bike
    fail "No more bike available" if working_bikes.empty?
    remove_bike(working_bikes.pop)
  end

  def dock(bike)
    fail "Bike cannot be docked, docking station is full" if full?
    add_bike(bike)
  end

  private
  def working_bikes
    @bikes.select { |bike| bike.working? }
  end

end
