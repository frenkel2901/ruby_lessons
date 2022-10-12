class Train
  attr_accessor :speed
  attr_reader :number, :type, :waggon
  @@all_trains = {} #для проверки
  
  def initialize(number, type, waggon) #создание с 3 заданными данными
    @number = number
    @type = type
    @waggon = waggon
    @@all_trains[number] = type
    @train_route = []
    @speed = 0
  end

  def stop #остановка
    @speed = 0 
  end

  def waggon_plus #добавление 1 вагона
    if speed == 0 && @waggon > 1
      @waggon = @waggon + 1
    end
  end

  def waggon_minus #убрать 1 вагон
    if speed == 0 && @waggon > 1
      @waggon = @waggon - 1
    end
  end
  
  def train_route(route) #принимает маршрут и занимает 1 станцию
    @train_route = route.route
    @position = route.route[0]
  end

  def next_station #следующая станция - поезд едет
    if @train_route.size > (@train_route.index(@position) + 1)
      @next_station = @train_route[@train_route.index(@position) + 1]
      @position = @train_route[@train_route.index(@position) + 1]
    end
  end

  def back_station #предыдущая станция - поезд едет
    if @train_route.index(@position) > 0
      @back_station = @train_route[@train_route.index(@position) - 1]
      @position = @train_route[@train_route.index(@position) - 1]
    end
  end

  def where_is_my_train #прошлая, настоящая и следующая станции
    puts @train_route[@train_route.index(@position) - 1] if @train_route.index(@position) > 0
    puts "Сейчас тут: #{@position}"
    puts @train_route[@train_route.index(@position) + 1] if @train_route.size > (@train_route.index(@position) + 1)
  end
end