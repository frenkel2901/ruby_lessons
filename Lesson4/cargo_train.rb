class CargoTrain < Train
  def waggon_plus(waggon) #добавление 1 вагона
    if waggon.class == CargoWaggon
      super 
    else
      puts 'Нельзя прикрепить пассажирский вагон к грузовому составу'
    end
  end
end