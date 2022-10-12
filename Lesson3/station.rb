class Station #пока не готово до конца
  def initialize(name)
    @name = name
  end

  def stations
    puts @@stations
  end

  def train_arrive
    puts "Поезд прибыл на станцию"
  end

  def train_departure
    puts "Поезд отправился со станции"
  end

  def train_on_stay
    puts "Cписок поездов на станции: "
  end

  def train_on_stay_type
    puts "Список поездов на станции с типом:"
    puts "Кол-во грузовых: кол-во пассажирских: "
  end
end