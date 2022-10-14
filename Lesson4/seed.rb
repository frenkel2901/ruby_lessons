cargo1 = CargoWaggon.new(1)
cargo2 = CargoWaggon.new(2)
cargo3 = CargoWaggon.new(3)
passanger_waggon1 = PassangerWaggon.new(1)
passanger_waggon2 = PassangerWaggon.new(2)
passanger_waggon3 = PassangerWaggon.new(3)

station1 = Station.new(1)
station2 = Station.new(2)
station3 = Station.new(3)
route1 = Route.new(station1, station3)
route1.new_station(station2)

station4 = Station.new(4)
station5 = Station.new(5)
station6 = Station.new(6)
route2 = Route.new(station4, station6)
route1.new_station(station5)

cargo_train1 = CargoTrain.new(1)
cargo_train1.train_route(route1)

cargo_train2 = CargoTrain.new(2)
cargo_train2.train_route(route1)

cargo_train3 = CargoTrain.new(3)
cargo_train3.train_route(route1)

passanger_train1 = PassangerTrain.new(1)
passanger_train1.train_route(route2)

passanger_train2 = PassangerTrain.new(2)
passanger_train2.train_route(route2)

passanger_train3 = PassangerTrain.new(3)
passanger_train3.train_route(route2)