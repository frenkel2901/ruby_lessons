class Station
  attr_reader :depo
  $stations_info = {}

  def initialize(name)
    @name = name
    @depo = []
    $stations_info[name] = @depo
  end

  def train_arrive(train)
    puts "Поезд #{train} прибыл на станцию #{self}"
    @depo << train
  end
  
  def train_departure(train)
    puts "Поезд #{train} отправился со станции #{self}"
    @depo.delete(train)
  end

  def stations_info
    @depo
    $stations_info
  end
end