class CargoWaggon < Waggon
  def take_place(place)
    if (self.size - n.to_i).negative?
      puts 'Not enough free places!'
    else
      @taken += place.to_i
      @size -= place.to_i
    end
  end
end
