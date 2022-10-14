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
  puts "5. Управлять вагонами поезда: " #прицеплять, отцеплять
  puts "6. Перемещать поезд по маршруту: "
  puts "7. Просмотреть список станций и поездов "
  input = gets.chomp.to_i
  break if input == 0

  puts input
  
  if input == 1
  end

  if input == 1
  end

  if input == 1
  end

  if input == 1
  end

  if input == 1
  end
  

end