require_relative 'waggon'
require_relative 'cargo_waggon'
require_relative 'passanger_waggon'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'route'
require_relative 'station'

class String 
  def to_Station
    Station.new(self)
  end
end

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
  break if input == 0

  if input == 1
    station_name = gets.chomp.to_s
    station_name = station_name.to_Station
    puts station_name.class
  end
end