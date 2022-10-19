class Station
  include InstanceCounter
  
  attr_reader :depo, :name
  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @depo = []
    @@all_stations << name
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