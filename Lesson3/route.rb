class Route
  attr_reader :route

  def initialize(first, last) #создаем путь с 1 и последней станциями
    @route = []
    @first = first
    @last = last
    @route[0] = first
    @route << last
  end

  def new_station(station) #добавилb новую выбранную станцию перед последней станцией
    @route.delete_at(-1)
    @route << station
    @route << @last
    puts @route 
  end

  def delete_station(station) #удаляем выбранную станцию
    unless station == @first || station == @last #запрещаем удалять 1 и последнюю станции
      @route.delete(station)
    end
  end

end