module BikeContainer

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def add_bike(bike)
    fail "#{self.class.name} is full" if full?
    @bikes << bike
  end

  def remove_bike
    fail "#{self.class.name} is empty" if empty?
    @bikes.pop
  end

  def full?
    @bikes.size == @capacity
  end

  def empty?
    @bikes.empty?
  end

end
