class Route
  attr_reader :first, :last
  attr_accessor :route, :name
  
  def initialize(name, first, last)
    @name = name
    @route = [first, last]
    @first = first
    @last = last
  end
  
  def new_station(station)
    @route.insert(-2, station)
  end
    
  def delete_station(station)
    @route.delete(station)
  end

  def validate!
    raise 'Title cannot be empty' if name.nil?
  end
end
