class Van

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def load_bike(bike)
    @bikes << bike
  end

  def unload_bike(bike)
    @bikes.pop
  end

end
