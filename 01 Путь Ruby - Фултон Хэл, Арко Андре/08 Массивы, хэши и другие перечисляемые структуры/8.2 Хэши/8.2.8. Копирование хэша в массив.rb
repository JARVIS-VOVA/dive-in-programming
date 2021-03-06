# Чтобы преобразовать весь хэш в массив, пользуйтесь методом to_a
# В получившемся массиве ключи станут элементами с четными индексами (начиная с 0), а значения — с нечетными:

h = {"а"=>1,"b"=>2}
p h.to_a # ["а",1,"b",2]

# Можно также получить массив, содержащий только ключи или только значения:

p h.keys   # ["а","b"]
p h.values # [1,2]

# Наконец, можно поместить в массив только значения, соответствующие заданному списку ключей.
# Этот метод работает для хэшей примерно так же, как одноименный метод для массивов.
# (Кроме того, как и в случае массивов, метод values_at заменяет устаревшие методы indices и indexes.)

h = {1=>"one", 2=>"two", 3=>"three", 4=>"four", "cinco"=>"five"}
p h.values_at(3,"cinco",4) # ["three","five","four"]
p h.values_at(1,3)         # ["one","three"]
