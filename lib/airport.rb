require_relative 'plane'

class Airport
  attr_reader :planes

  CAPACITY = 10

  def initialize
    @planes = []
  end

  #encapsulated planes array
  def planes
    @planes.dup
  end

  def land(plane)
    fail "The airport is full" if @planes.size > CAPACITY
    fail "Can't land now, it's stormy!" if weather_status == "stormy"
    fail "This plane has already been landed" if plane.status == "landed"
    plane.landed
    @planes << plane
  end

  def takeoff(plane)
    fail "Can't take off now, it's stormy" if weather_status == "stormy"
    fail "This plane is already flying" if plane.status == "flying"
    if @planes.include?(plane)
      plane.fly
      @planes.reject {|p| p == plane}
    else
      fail "This plane doesn't exist here"
    end
    plane
  end

  private

  def weather_status
    weather = ["sunny","sunny","sunny","sunny","stormy",
               "sunny","sunny","stormy","sunny","sunny"]
    weather.sample
  end

end