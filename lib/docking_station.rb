class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
  end
end
