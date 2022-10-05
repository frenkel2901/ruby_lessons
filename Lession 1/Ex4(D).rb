=begin
D = b**2 - 4ac

Если D = 0, вывести 1 корень (1 и 2 корни равны)
Если D > 0, вывести 2 корня
Если D < 0, вывести значение и написать "Корней нет"

=end

puts "Введите a, b и с"
print "a = "
a = gets.chomp.to_f

print "b = "
b = gets.chomp.to_f

print "c = "
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d > 0
    x1 = (-b + Math.sqrt(d))/(2 * a)
    x2 = (-b - Math.sqrt(d))/(2 * a)
    puts " Дискриминант = #{d}, x1 = #{x1} x2 = #{x2}"
elsif d == 0
    x= (-b)/(2 * a)
    puts " Дискриминант = #{d}, x = #{x}"
else
    puts "Значение дискриминанта #{d}. Корней нет" 
end