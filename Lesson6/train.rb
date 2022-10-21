require_relative 'instance_counter.rb'
require_relative 'manufacture.rb'
require_relative 'valid.rb'

class Train
  include Manufacture
  include InstanceCounter
  include Valid
  
  attr_accessor :number
  attr_reader :waggon, :train_route, :speed

  @@all_trains = []

  TRAIN_NUM = /^[a-z0-9]{3}(|-)[a-z0-9]{2}$/i

  def self.find(number)
    @@all_trains.find { |train| train.number == number}
  end

  def initialize(number) #создание
    @number = number
    validate!
    @waggon = []
    @train_route = []
    @speed = 0
    @@all_trains << self
    puts "-----\n Создан поезд: #{number} \n-----"
  end

  def stop #остановка
    @speed = 0 
  end

  def waggon_plus(waggon) #добавление 1 вагона
    @waggon << waggon if speed == 0
    @waggon = @waggon.uniq
  end

  def waggon_minus(waggon)  #убрать 1 вагон
    @waggon.delete(waggon) if speed == 0
  end

  def train_route(route) #принимает маршрут и занимает 1 станцию
     @train_route = route.route
     @position = route.route[0]
     @position.train_arrive(self)
  end

  def next_station #следующая станция - поезд едет
    if @train_route.size > (@train_route.index(@position) + 1) #запрешаем ехать с последней станции вперед
      @position.train_departure(self) #отправляем поезд со станции, на которой он стоит
      @next_station = @train_route[@train_route.index(@position) + 1]
      @position = @train_route[@train_route.index(@position) + 1]
      @position.train_arrive(self) #принимаем поезд на новой станции
    end
  end

  def back_station #предыдущая станция - поезд едет
    if @train_route.index(@position) > 0 #запрещаем ехать назад с 1 станции
      @position.train_departure(self) #отправляем поезд со станции, на которой он стоит
      @back_station = @train_route[@train_route.index(@position) - 1]
      @position = @train_route[@train_route.index(@position) - 1]
      @position.train_arrive(self) #принимаем поезд на новой станции
    end
  end

  private
  
  attr_writer :speed, :waggon

  def validate!
    raise "Номер не может быть пустым" if number.nil?
    raise "Номер должен содержать 5 или 6 символов" if number.length < 5
    raise "Некорректный формат номера: \n
    введите 3 буквы или цифры, тире (не обязательно) и еще 2 буквы или цифры" if number !~ TRAIN_NUM
  end
    
end
