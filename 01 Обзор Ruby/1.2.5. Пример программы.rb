print "Введите температуру и шкалу (С or F): "
str = gets
exit if str.nil? or str.empty?
str.chomp!
temp, scale = str.split(" ")

abort "#{temp} недопустимое число." if temp !~ /-?\d+/

temp = temp.to_f
case scale
  when "C", "c"
    f = 1.8*temp + 32
  when "F", "f"
    c = (5.0/9.0)*(temp-32)
else
  abort "Необходимо задать С или F."
end

if f.nil?
  print "#{c} градусов C\n"
else
  print "#{f} градусов F\n"
end

=begin
  Введите температуру и шкалу (С or F): 98.6 F
  37.0 градусов С

  Введите температуру и шкалу (С or F): 100 С
  212.0 градусов F

  Введите температуру и шкалу (С or F): 92 G
  Необходимо задать С или F.

  Введите температуру и шкалу (С or F): junk F
  junk недопустимое число.
=end
