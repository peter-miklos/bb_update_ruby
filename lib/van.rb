class Van
  def initialize
    @bikes = []
  end

  def load_bike(bike)
    @bikes << bike
  end

  def unload_bike(bike)
    @bikes.pop
  end

end
