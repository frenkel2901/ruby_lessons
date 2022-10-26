require_relative 'instance_counter'
require_relative 'valid'

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
    puts "-----\n Station created: #{name} \n-----"
  end

  def train_arrive(train)
    puts "Train '#{train.number}' arrived at the station '#{self.name}' "
    @depo << train
  end
  
  def train_departure(train)
    puts "Train '#{train.number}' left the station '#{self.name}' "
    @depo.delete(train)
  end
  
  def station_info
    if block_given?
      depo.each { |train| yield train } 
    else
      @depo
    end
  end

  private

  def validate!
    raise "Name cannot be empty" if name.nil?
  end
    
end