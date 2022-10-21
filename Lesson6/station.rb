require_relative 'instance_counter.rb'
require_relative 'valid.rb'

class Station
  include InstanceCounter
  attr_reader :depo
  attr_accessor :name
  
  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    validate!
    @depo = []
    @@all_stations << name
    puts "-----\n Создана станция: #{name} \n-----"
  end

  def train_arrive(train)
    puts "Поезд '#{train.number}' прибыл на станцию '#{self.name}' "
    @depo << train
  end
  
  def train_departure(train)
    puts "Поезд '#{train.name}' отправился со станции '#{self.name}' "
    @depo.delete(train)
  end

  def station_info
    @depo
  end

  private

  def validate!
    raise "Название не может быть пустым" if name.nil?
  end
    
end