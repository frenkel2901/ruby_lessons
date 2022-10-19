class PassangerTrain < Train
  def waggon_plus(waggon) #добавление 1 вагона
    if waggon.class == PassangerWaggon
      super 
    else
      puts 'Нельзя прикрепить грузовой вагон к пассажирскому составу'
    end
  end
end