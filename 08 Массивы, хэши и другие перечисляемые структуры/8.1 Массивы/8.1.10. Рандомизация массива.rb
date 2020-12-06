class Array
  def randomize
    self.sort_by { rand } # Сортировать по ключу, являющемуся
  end
                   # случайным числом.
  def randomize!
    self.replace(self.randomize)
  end
end

x = [1, 2, 3, 4, 5]
p y = x.randomize   # [3, 2, 4, 1, 5]
p x.randomize!    # x равно [3, 5, 4, 2]

# Выбрать случайный элемент массива (не запрещая дубликатов) можно так:

class Array
  def pick_random
    self[rand(self.length)]
  end
end
