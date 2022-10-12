class Station
  attr_reader :depo

  def initialize(name)
    @name = name
    @depo = []
  end

  def train_arrive(train)
    puts "Поезд #{train} прибыл на станцию"
    @depo << train
  end

  def train_departure(train)
    puts "Поезд #{train} отправился со станции"
    @depo.delete(train)
  end

  def train_on_stay_type(type)
    i = 0
    @depo.each do |train| 
      if train.type == type
        i = i + 1
      end
    end
    puts "#{i} поездов на станции с типом: #{type}"
  end
end