=begin
  К классу Hash подмешан модуль Enumerable,
  поэтому можно обращаться к методам detect(find), select(find_all), grep, min, max и reject (как и для массивов).

  Метод detect (синоним find) находит одну пару ключ-значение.
  Он принимает блок (которому передается по одной паре за раз) и возвращает первую пару, для которой вычисление блока дает true
=end

names = {"fred"=>"jones","jane"=>"tucker", "joe"=>"tucker","mary"=>"SMITH"}
# Найти tucker.
p names.detect {|k,v| v=="tucker" } # ["joe","tucker"]
# Найти имена, записанные прописными буквами.
p names.find {|k,v| v==v.upcase }   # ["mary", "SMITH"]

=begin
  Разумеется, объекты в хэше могут быть сколь угодно сложными, как и условие, проверяемое в блоке,
  но сравнение объектов разных типов может оказаться проблематичным.

  Метод select (синоним find_all) возвращает все пары, удовлетворяющие условию, а не только первую:
=end

p names.select {|k,v| v=="tucker" }
# [["joe", "tucker"], ["jane", "tucker"]]
p names.find_all {|k,v| k.count("r")>0}
# [["mary", "SMITH"], ["fred", "jones"]]
