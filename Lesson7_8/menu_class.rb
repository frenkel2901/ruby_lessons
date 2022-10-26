TRAIN_TYPER = [
  {i: 1, type: "Select type\n1 cargo", 
    parameter: :c_trains, class: CargoTrain, 
    w_class: CargoWaggon, w_parameter: :c_waggons},
  {i: 2, type: '2 passanger', 
    parameter: :p_trains, class: PassangerTrain, 
    w_class:PassangerWaggon, w_parameter: :p_waggons}
].freeze

class Menu

  MENU = [{num: 1, title: 'Создать станцию', todo: :create_station},
    {num: 2, title: 'Создать поезд', todo: :create_train},
    {num: 3, title: 'Создать моршрут и управлять станциями', todo: :route_manager},
    {num: 4, title: 'Назначить маршрут поезду', todo: :route_for_train},
    {num: 5, title: 'Добавить вагон поезду', todo: :waggon_plus_train},
    {num: 6, title: 'Отцепить вагон от поезда', todo: :waggon_munus_train},
    {num: 7, title: 'Перемещать поезд по маршруту', todo: :drive_train},
    {num: 8, title: 'Просмотреть список станций и поездов', todo: :stations_list},
    {num: 9, title: 'Настройка вагонов поезда', todo: :w_manager}].freeze

  def initialize
    @data_store = {:routes => {}, :c_trains => {}, :p_trains => {}, :stations => {}, :c_waggons => {}, :p_waggons => {}}
  end

  def start
    loop do
      MENU.each do |list| 
        puts "#{list[:num]} - #{list[:title]}"
      end
      puts "0 - Выйти"
      choise = gets.chomp.to_i
      todo_hash = MENU.find { |list| list[:num] == choise }
      send(todo_hash[:todo]) unless todo_hash.nil?
      break if choise.zero?
    end
  end
end 

def create_station
  print "Ведите название станции: "
  name_station = gets.chomp.to_s
  key = name_station
  name_station = Station.new(name_station)
  @data_store[:stations][key] = name_station
end

def w_manager
  TRAIN_TYPER.each {|list| puts "#{list[:type]}"}
  i_type = gets.chomp.to_i
  train_hash = TRAIN_TYPER.find { |list| list[:i] == i_type }

  puts 'Enter train number'
  num_train = gets.chomp.to_s
  key = num_train
  puts 'list List of wagons'
  puts 'take Take a seat on the train'
  i = gets.chomp.to_s
  
  if i == 'list'
    @data_store[train_hash[:parameter]][key].waggon_info{ |x| puts "#{x.class} номер #{x.name} свободно #{x.size} занято #{x.taken}" }

  elsif i_type == 1 && i == 'take'
    puts 'Введите номер вагона'
    num_waggon = gets.chomp.to_s
    wkey = num_waggon
    
    if train_hash[:class] == CargoTrain
      puts 'Сколько места занять?' 
      take = gets.chomp.to_i
    end
    
    @data_store[train_hash[:w_parameter]][wkey].take_place(take)
  end
end


def create_train
  TRAIN_TYPER.each {|list| puts "#{list[:type]}"}
  i_type = gets.chomp.to_i

  print "-----\n  Ведите номер поезда: "
  num_train = gets.chomp.to_s
  key = num_train
  train_hash = TRAIN_TYPER.find { |list| list[:i] == i_type }
  
  num_train = train_hash[:class].new(num_train) unless train_hash.nil?
  @data_store[train_hash[:parameter]][key] = num_train unless train_hash.nil?

  rescue RuntimeError => e
    puts "#####\n  Проверьте, правильно ли введен номер: \n  #{e}\n#####"
  retry
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

  name_route = Route.new(name_route, first_station, last_station)
  @data_store[:routes][key] = name_route
  @data_store[:stations][fkey] = first_station
  @data_store[:stations][lkey] = last_station
  end

  if i_route == 'new'
    puts "Добавить существующую станцию в маршрут"

    print "Ведите название станции: "
    new_station = gets.chomp.to_s
    skey = new_station

    print "Ведите название маршрута: "
    route_choise = gets.chomp.to_s
    key = route_choise 

    @data_store[:routes][key].new_station(@data_store[:stations][skey])
  end

  if i_route == 'del'
    puts "Удалить станцию из маршрута"

    print "Ведите название станции: "
    new_station = gets.chomp.to_s
    skey = new_station

    print "Ведите название маршрута: "
    route_choise = gets.chomp.to_s
    key = route_choise 

    @data_store[:routes][key].delete_station(@data_store[:stations][skey])
  end
end

def route_for_train
  TRAIN_TYPER.each {|list| puts "#{list[:type]}"}
  i_type = gets.chomp.to_i

  puts 'Введите название поезда'
  num_train = gets.chomp.to_s
  key = num_train
  train_hash = TRAIN_TYPER.find { |list| list[:i] == i_type }

  print "Ведите название маршрута: "
  route_choise = gets.chomp.to_s
  rkey = route_choise 
  
  @data_store[train_hash[:parameter]][key].train_route(@data_store[:routes][rkey])
end

def waggon_plus_train
  TRAIN_TYPER.each {|list| puts "#{list[:type]}"}
  i_type = gets.chomp.to_i

  puts 'Введите название поезда'
  num_train = gets.chomp.to_s
  key = num_train
  train_hash = TRAIN_TYPER.find { |list| list[:i] == i_type }

  puts "exist Добавить к поеду существующий вагон\nnew Добавить новый вагоны к поезду"
  choise = gets.chomp.to_s

  puts 'Введите номер вагона'
  num_waggon = gets.chomp.to_s
  wkey = num_waggon

  if choise == 'new'
    puts 'Введите объем вагона'
    size = gets.chomp.to_i
    num_waggon = train_hash[:w_class].new(num_waggon, size)
    @data_store[train_hash[:w_parameter]][wkey] = num_waggon
    @data_store[train_hash[:parameter]][key].waggon_plus(num_waggon)

  elsif i_type == 1 && choise == 'exist'
    @data_store[train_hash[:parameter]][key].waggon_plus(@data_store[train_hash[:w_parameter]][wkey])
  end
end

def waggon_munus_train
  TRAIN_TYPER.each {|list| puts "#{list[:type]}"}
  i_type = gets.chomp.to_i
  
  puts 'Введите название поезда'
  num_train = gets.chomp.to_s
  key = num_train
  train_hash = TRAIN_TYPER.find { |list| list[:i] == i_type }

  puts 'Введите номер вагона'
  num_waggon = gets.chomp.to_s
  wkey = num_waggon

  @data_store[train_hash[:parameter]][key].waggon_minus(@data_store[train_hash[:w_parameter]][wkey])
end

def drive_train
  TRAIN_TYPER.each {|list| puts "#{list[:type]}"}
  i_type = gets.chomp.to_i

  puts 'Введите номер поезда'
  num_train = gets.chomp.to_s
  key = num_train
  train_hash = TRAIN_TYPER.find { |list| list[:i] == i_type }

  puts "1. Ехать вперед"
  puts "2. Ехать назад"
  i = gets.chomp.to_i

  case i
  when 1
    @data_store[train_hash[:parameter]][key].next_station
  when 2
    @data_store[train_hash[:parameter]][key].back_station
  end    
end

def stations_list
  @data_store[:stations].each do |key, value|
    puts "На станции #{key} находятся поезда:"
    value.station_info{ |x| puts "#{x.class} номер #{x.number} #{x.waggon.size} вагонов" }
 end
end