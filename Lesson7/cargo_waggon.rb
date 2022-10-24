class CargoWaggon < Waggon

  def take_place(n)
    if (self.size - n.to_i) < 0
      puts "Не достаточно свободного мест!"
    else
      @taken += n.to_i
      @size -= n.to_i
    end
  end
  
end