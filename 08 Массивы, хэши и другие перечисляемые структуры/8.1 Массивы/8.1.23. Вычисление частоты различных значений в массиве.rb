# Для массивов нет метода count, как для строк (чтобы подсчитать число вхождений каждого элемента).
# Поэтому создадим свой собственный:

class Array
  def count
    k = Hash.new(0)
    self.each{ |x| k[x]+=1 }
    k
  end
end

meal = %w[spam spam eggs ham eggs spam]
p items = meal.count
# items равно {"ham" => 1, "spam" => 3, "eggs" => 2}
p spams = items["spam"] # 3

# Обратите внимание, что метод возвращает хэш.
