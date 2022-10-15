require_relative 'waggon'
require_relative 'cargo_waggon'
require_relative 'passanger_waggon'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'route'
require_relative 'station'

$data_store = {:routes => {}, :c_trains => {}, :p_trains => {}, :stations => {}}

puts "Введите номер необходимой операции: "
puts "1. Создать станцию: "
puts "2. Создать поезд: "
puts "3. Создать моршрут и управлять станциями: "
puts "4. Назначить маршрут поезду: "
puts "5. Добавить вагон поезду: "
puts "6. Отцепить вагон от поезда: "
puts "7. Перемещать поезд по маршруту: "
puts "8. Просмотреть список станций и поездов "
puts "0. Выйти"

def create_station
  print "Ведите название станции: "
  name_station = gets.chomp.to_s
  key = name_station
  name_station = Station.new(name_station)
  $data_store[:stations][key] = name_station

  return $data_store
end

def create_train
  puts "1. Грузовой поезд"
  puts "2. Пассажирский поезд"
  i_type = gets.chomp.to_i
  print "Ведите номер поезда: "
  num_train = gets.chomp.to_s
  key = num_train

  if i_type == 1
  num_train = CargoTrain.new(num_train) 
  $data_store[:c_trains][key] = num_train
  end

  if i_type == 2
  num_train = PassangerTrain.new(num_train)
  $data_store[:p_trains][key] = num_train
  end

  return $data_store

end

def route_manager
  puts "add - Создать маршрут"
  puts "new - Добавить станцию в маршрут"
  puts "del - Удалить станцию из маршрута"
  i_route = gets.chomp.to_s

  if i_route == 'add'

  print "Ведите название маршрута: "
  name_route = gets.chomp.to_s
  key = name_route
  
  print "Создайте первую станцию: "
  first_station = gets.chomp.to_s
  fkey = first_station
  first_station = Station.new(first_station)

  print "Создайте последнюю станцию: "
  last_station = gets.chomp.to_s
  lkey = last_station
  last_station = Station.new(last_station)

  name_route = Route.new(first_station, last_station)
  $data_store[:routes][key] = name_route
  $data_store[:stations][fkey] = first_station
  $data_store[:stations][lkey] = last_station

  return $data_store
  end

  if i_route == 'new'
    puts "Добавить существующую станцию в маршрут"

    print "Ведите название станции: "
    new_station = gets.chomp.to_s
    skey = new_station

    print "Ведите название маршрута: "
    route_choise = gets.chomp.to_s
    key = route_choise 

    $data_store[:routes][key].new_station($data_store[:stations][skey])
    return $data_store
  end

  if i_route == 'del'
    puts "Удалить станцию из маршрута"

    print "Ведите название станции: "
    new_station = gets.chomp.to_s
    skey = new_station

    print "Ведите название маршрута: "
    route_choise = gets.chomp.to_s
    key = route_choise 

    return $data_store[:stations][skey]
  end
end

def all_info
  puts $stations_info
end