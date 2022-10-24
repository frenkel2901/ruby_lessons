require_relative 'valid.rb'

class Route
  attr_reader :first, :last
  attr_accessor :route, :name
  
  def initialize(name, first, last) #создаем путь с 1 и последней станциями
    @name = name
    @route = [first, last]
    @first = first
    @last = last
  end
  
  def new_station(station) #добавить новую выбранную станцию перед последней станцией (если такой нет)
    @route.insert(-2, station)
  end
    
  def delete_station(station) #удаляем выбранную станцию
    @route.delete(station)
  end

  def validate!
    raise "Название не может быть пустым" if name.nil?
  end
end