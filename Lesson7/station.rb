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
  
  # Метод station_info теперь может принимать блок
  # Если блок задан
  # Метед перебирает поезда, передевая в блок их для обработки кодом блока
  # Если блок не задан, метод просто выводит @depo с поездами
  def station_info
    if block_given?
      depo.each { |train| yield train } 
    else
      @depo
    end
  end
  # ________________ 
  
  private

  def validate!
    raise "Название не может быть пустым" if name.nil?
  end
    
end

