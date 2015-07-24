require_relative './bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  
  def initialize (cap = DEFAULT_CAPACITY)
    @capacity = cap
    @bikes = []
  end

  def release_bike
    fail 'No bikes - disaster!' if empty?
    fail 'Bike is broken' unless bikes.last.working?
    bikes.pop
  end

  def dock(bike)
    fail 'Station is full!' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.length >= capacity
  end
end


