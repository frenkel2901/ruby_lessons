require_relative 'waggon'
require_relative 'cargo_waggon'
require_relative 'passanger_waggon'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'route'
require_relative 'station'

list = {"Выйти" => 0,
"Создать станцию" => 1,
"Создать поезд" => 2,
"Создать моршрут и управлять станциями" => 3,
"Назначить маршрут поезду" => 4,
"Добавить вагон поезду" => 5,
"Отцепить вагон от поезда" => 6,
"Перемещать поезд по маршруту" => 7,
"Просмотреть список станций и поездов" => 8}


$data_store = {:routes => {}, :c_trains => {}, :p_trains => {}, :stations => {}, :waggons => {}}

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

    $data_store[:routes][key].delete_station($data_store[:stations][skey])

    return $data_store
  end
end

def route_for_train
  puts "1. Путь для грузового поезда"
  puts "2. Путь для пассажирского поезда"
  i_type = gets.chomp.to_i
  puts 'Введите название поезда'
  num_train = gets.chomp.to_s
  key = num_train
  print "Ведите название маршрута: "
  route_choise = gets.chomp.to_s
  rkey = route_choise 
  
  if i_type == 1
    $data_store[:c_trains][key].train_route($data_store[:routes][rkey])
  end

  if i_type == 2
    $data_store[:p_trains][key].train_route($data_store[:routes][rkey])
  end

  return $data_store
  
end

def waggon_plus_train
  puts "1. к грузовому"
  puts "2. к пассажирскому"
  i_type = gets.chomp.to_i
  puts 'Введите название поезда'
  num_train = gets.chomp.to_s
  key = num_train
  
  puts 'Введите номер вагона'
  num_waggon = gets.chomp.to_s
  wkey = num_waggon

  if i_type == 1
    num_waggon = CargoWaggon.new(num_waggon)
    $data_store[:waggons][wkey] = num_waggon
    $data_store[:c_trains][key].waggon_plus(num_waggon)
  end

  if i_type == 2
    num_waggon = CargoWaggon.new(num_waggon)
    $data_store[:waggons][wkey] = num_waggon
    $data_store[:p_trains][key].waggon_plus(num_waggon)
  end
end

def waggon_munus_train
  puts "1. от грузового"
  puts "2. от пассажирского"
  i_type = gets.chomp.to_i
  puts 'Введите название поезда'
  num_train = gets.chomp.to_s
  key = num_train

  puts 'Введите номер вагона'
  num_waggon = gets.chomp.to_s
  wkey = num_waggon

  if i_type == 1
    $data_store[:c_trains][key].waggon_minus($data_store[:waggons][wkey])
  end

  if i_type == 2
    $data_store[:p_trains][key].waggon_minus($data_store[:waggons][wkey])
  end
end

def drive_train
  puts "1. Грузовой поезд"
  puts "2. Пассажирский поезд"
  i_type = gets.chomp.to_i
  puts 'Введите номер поезда'
  num_train = gets.chomp.to_s
  key = num_train

  puts "1. Грузовой поезд"
  puts "2. Пассажирский поезд"

  if i_type == 1
    puts "1. Ехать вперед"
    puts "2. Ехать назад"
    i = gets.chomp.to_i

    case i
    when 1
      $data_store[:c_trains][key].next_station
    when 2
      $data_store[:c_trains][key].back_station
    end    
  end

  if i_type == 2
    puts "for. Ехать вперед"
    puts "back. Ехать назад"
    i = gets.chomp.to_s

    case i
    when "for"
      $data_store[:p_trains][key].next_station
    when "back"
      $data_store[:p_trains][key].back_station
    end    
  end
end

def stations_list
  puts $stations_info
end

def information
  $data_store
end

loop do
  list.each do |key, value| 
    puts "#{value} = #{key}"
  end
  choise = gets.chomp.to_i

  send (:create_station) if choise == 1
  send (:create_train) if choise == 2
  send (:route_manager) if choise == 3
  send (:route_for_train) if choise == 4
  send (:waggon_plus_train) if choise == 5
  send (:waggon_munus_train) if choise == 6
  send (:drive_train) if choise == 7
  send (:stations_list) if choise == 8
  
  break if choise == 0
end
