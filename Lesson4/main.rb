require_relative 'waggon'
require_relative 'cargo_waggon'
require_relative 'passanger_waggon'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'route'
require_relative 'station'

loop do
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
  input = gets.chomp.to_i

  case input
  
  when 1
    print "Ведите название станции: "
    name_station = gets.chomp

    name_station = Station.new(name_station)
    puts name_station
    puts name_station.depo

  when 2
    puts "1. Грузовой поезд"
    puts "2. Пассажирский поезд"
    i_type = gets.chomp.to_i

    print "Ведите номер поезда: "
    num_train = gets.chomp

    num_train = CargoTrain.new(num_train) if i_type == 1
    num_train = PassangerTrain.new(num_train) if i_type == 2

    puts num_train
  when 3


  when 8
    puts $stations_info
  end
  
end