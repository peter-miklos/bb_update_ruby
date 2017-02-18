class Van

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def load_bike(bike)
    fail "Bike cannot be loaded, van is full" if full?
    @bikes << bike
  end

  def unload_bike(bike)
    fail "The bike is not in the van" unless @bikes.include?(bike)
    @bikes.pop
  end

  private

  def full?
    @bikes.size == @capacity
  end

end
