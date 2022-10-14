class Train
  attr_accessor :speed
  attr_reader :number, :waggon, :train_route

  def initialize(number) #создание
    @number = number
    @waggon = []
    @train_route = []
    @speed = 0
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
end