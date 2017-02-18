class Bike

  def initialize
    @bike_works = true
  end

  def working?
    @bike_works
  end

  def set_broken
    fail "The bike is already broken" unless @bike_works
    @bike_works = false
  end

  def repair_bike
    fail "The bike is not broken" if @bike_works
    @bike_works = true
  end
end
