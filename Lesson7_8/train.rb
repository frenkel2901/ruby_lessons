require_relative 'instance_counter'
require_relative 'manufacture'
require_relative 'valid'

class Train
  include Manufacture
  include InstanceCounter
  include Valid
  
  attr_accessor :number
  attr_reader :waggon, :train_route, :speed

  @@all_trains = []

  TRAIN_NUM = /^[a-z0-9]{3}(|-)[a-z0-9]{2}$/i

  def self.find(number)
    @@all_trains.find { |train| train.number == number }
  end

  def initialize(number)
    @number = number
    validate!
    @waggon = []
    @train_route = []
    @speed = 0
    @@all_trains << self
    puts "-----\n Train created: #{number} \n-----"
  end

  def stop
    @speed = 0
  end

  def waggon_info
    if block_given?
      waggon.each { |waggon| yield waggon }
    else
      @waggon
    end
  end

  def waggon_plus(waggon)
    @waggon << waggon if speed.zero?
    @waggon = @waggon.uniq
  end

  def waggon_minus(waggon)
    @waggon.delete(waggon) if speed.zero?
  end

  def train_route(route)
    @train_route = route.route
    @position = route.route[0]
    @position.train_arrive(self)
  end

  def next_station
    if @train_route.size > (@train_route.index(@position) + 1)
      @position.train_departure(self)
      @next_station = @train_route[@train_route.index(@position) + 1]
      @position = @train_route[@train_route.index(@position) + 1]
      @position.train_arrive(self)
    end
  end

  def back_station
    if @train_route.index(@position).positive?
      @position.train_departure(self)
      @back_station = @train_route[@train_route.index(@position) - 1]
      @position = @train_route[@train_route.index(@position) - 1]
      @position.train_arrive(self)
    end
  end

  private
  
  attr_writer :speed, :waggon

  def validate!
    raise 'Number cannot be empty' if number.nil?

    raise 'The number must contain 5 or 6 characters' if number.to_s.length < 5

    raise "Invalid number format: \nXXXXX or XXX-XX, X - number or letter" if number.to_s !~ TRAIN_NUM
  end
end
