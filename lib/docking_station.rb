class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No more bike available" if working_bikes.empty?
    @bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    @bikes << bike
  end

  private
  def working_bikes
    @bikes.select { |bike| bike.working? }
  end
end
