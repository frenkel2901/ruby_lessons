=begin
прямоугольный треугольник

1) Реален ли заданный треугольник. Для этого сумма двух сторон ВСЕГДА 
должна быть меньше 3 стороны. Также все заданные стороны > 0
a > 0, b > 0, c > 0;
a + b > c, a + c > b, b + c > a:

2) Проверка на равносторонный треугольник a = b = c, если 
равносторонний, вывести Равносторонний.

3) Проверка на прямоугольный. Находим наибольшее из 3 
и подставляем его в теорему Пифагора. Если правда, вывести
Прямоугольный. Если не правда - ничего не выводить
=end

puts "Введите стороны треугольника"
print "a = "
a = gets.chomp.to_f
print "b = "
b = gets.chomp.to_f
print "c = "
c = gets.chomp.to_f

puts "Данные некорректны" unless a > 0 && b > 0 && c > 0 && a + b > c && a + c > b && b + c > a

puts "Ваш треугольник РАВНОСТОРОННИЙ!" if a == b && b == c

if a > b && a > c && a**2 == b**2 + c**2
    puts "Ваш треугольник ПРЯМОУГОЛЬНЫЙ!"
elsif b > c && b > c && b**2 == a**2 + c**2
    puts "Ваш треугольник ПРЯМОУГОЛЬНЫЙ!"
elsif c > a && c > b && c**2 == a**2 + b**2
    puts "Ваш треугольник ПРЯМОУГОЛЬНЫЙ!"
else
    #Программа ничего не выдаст
end
