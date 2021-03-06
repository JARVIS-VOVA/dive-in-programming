=begin
  Печально, но факт: в компьютере числа с плавающей точкой представляются неточно.
  В идеальном мире следующий код напечатал бы «да», но на всех машинах где мы его запускали, печатается «нет»:
=end

x = 1000001.0/0.003
y = 0.003*x
if y == 1000001.0
 puts "да"
else
 puts "нет"
end

=begin
  Объясняется это тем, что для хранения числа с плавающей точкой выделено конечное число битов,
  а с помощью любого, сколь угодно большого,
  но конечного числа битов нельзя представить периодическую десятичную дробь с бесконечным числом знаков после запятой.

  Из-за этой неустранимой неточности при сравнении чисел с плавающей точкой мы можем оказаться в ситуации (продемонстрированной выше),
  когда с практической точки зрения два числа равны, но аппаратура упрямо считает их различными.
=end
