module BikeContainer

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def add_bike(bike)
    @bikes << bike
  end

  def remove_bike(bike)
    @bikes.delete(bike)
  end

  def full?
    @bikes.size == @capacity
  end

end
