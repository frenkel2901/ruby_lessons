class Route
  attr_reader :route, :first, :last
  attr_writer :route

  def initialize(first, last) #создаем путь с 1 и последней станциями
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
end