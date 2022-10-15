require_relative 'waggon'
require_relative 'cargo_waggon'
require_relative 'passanger_waggon'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'route'
require_relative 'station'

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
  name_station = gets.chomp

  name_station = Station.new(name_station)
  puts name_station
  puts name_station.depo

end

def create_train

  puts "1. Грузовой поезд"
  puts "2. Пассажирский поезд"
  i_type = gets.chomp.to_i
  print "Ведите номер поезда: "
  num_train = gets.chomp
  num_train = CargoTrain.new(num_train) if i_type == 1
  num_train = PassangerTrain.new(num_train) if i_type == 2

  puts num_train
end

def route_manager
  puts "add - Создать маршрут"
  puts "new - Добавить станцию в маршрут"
  puts "del - Удалить станцию из маршрута"
  i_route = gets.chomp.to_s

  if i_route == 'add'

  print "Ведите название маршрута: "
  name_route = gets.chomp
  
  print "Создайте первую станцию: "
  first_station = gets.chomp
  first_station = Station.new(first_station)

  print "Создайте последнюю станцию: "
  last_station = gets.chomp
  last_station = Station.new(last_station)

  name_route = Route.new(first_station, last_station)

  puts name_route

  end

  if i_route == 'new'
    puts "Добавить существующую станцию в маршрут"

    print "Ведите название станции: "
    new_station = gets.chomp

    print "Ведите название маршрута: "
    route_choise = gets.chomp
    route_choise.new_station(new_station)
  end

  if i_route == 'del'
    puts "Удалить станцию из маршрута"

    print "Ведите название маршрута: "
    route_choise = gets.chomp

    print "Ведите название станции: "
    del_station = gets.chomp

    route_choise.delete_station(del_station)
  end
end

def all_info
  puts $stations_info
end