class Garage

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    fail "Bike cannot be added, garage is full" if full?
    @bikes << bike
  end

  def repair_bike(bike)
    @bikes[@bikes.index(bike)].repair_bike
  end

  def remove_bike(bike)
    fail "Bike is not in the garage" unless @bikes.include?(bike)
    @bikes.delete(bike)
  end

  private

  def full?
    @bikes.size == @capacity
  end
end
