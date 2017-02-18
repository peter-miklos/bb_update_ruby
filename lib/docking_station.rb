require "./lib/bike.rb"

class DockingStation

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "No more bike available" if working_bikes.empty?
    @bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    fail "Bike cannot be docked, docking station is full" if station_full?
    @bikes << bike
  end

  private
  def working_bikes
    @bikes.select { |bike| bike.working? }
  end

  def station_full?
    @bikes.size == @capacity
  end
end
