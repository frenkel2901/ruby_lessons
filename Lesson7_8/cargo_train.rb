class CargoTrain < Train

  CargoTrain.validate(self, :format, TRAIN_NUM)

  def waggon_plus(waggon)
    if instance_of?(CargoWaggon)
      super
    else
      puts 'You can not attach a passenger car to a freight train'
    end
  end
end
