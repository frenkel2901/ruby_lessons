class PassangerTrain < Train

  PassangerTrain.validate(self, :format, TRAIN_NUM)

  def waggon_plus(waggon)
    if instance_of?(PassangerWaggon)
      super
    else
      puts 'Prohibit attaching a freight car to a passenger train'
    end
  end
end
