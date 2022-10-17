class Station
  attr_reader :depo, :name

  def initialize(name)
    @name = name
    @depo = []
  end

  def train_arrive(train)
    puts "Поезд #{train} прибыл на станцию #{self}"
    @depo << train
  end
  
  def train_departure(train)
    puts "Поезд #{train} отправился со станции #{self}"
    @depo.delete(train)
  end

  def station_info
    @depo
  end
end