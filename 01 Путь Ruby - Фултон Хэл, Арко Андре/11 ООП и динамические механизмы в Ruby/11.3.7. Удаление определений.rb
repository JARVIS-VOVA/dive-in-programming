=begin
  Вследствие динамичности Ruby практически все, что можно определить, можно и уничтожить.
  Это может пригодиться, например, для того, чтобы «развязать» два куска кода в одной и той же области действия,
  избавляясь от переменных после того, как они были использованы.
  Другой повод — запретить вызовы некоторых потенциально опасных методов.
  Но по какой бы причине вы ни удаляли определение, делать это нужно крайне осторожно, чтобы не создать себе проблемы во время отладки.

  Радикальный способ уничтожить определение — воспользоваться ключевым словом undef
  (неудивительно, что его действие противоположно действию def).
  Уничтожать можно определения методов, локальных переменных и констант на верхнем уровне.
  Хотя имя класса — тоже константа, удалить определение класса таким способом невозможно.
=end

def asbestos
  p "Теперь не огнеопасно"
end

tax =0.08
PI = 3
asbestos

p "PI=#{PI}, tax=#{tax}"

undef asbestos
undef tax
undef PI
# Любое обращение к этим трем именам теперь приведет к ошибке.

=begin
  Внутри определения класса можно уничтожать определения методов и констант в том же контексте, в котором они были определены.
  Нельзя применять undef внутри определения метода, а также к переменной экземпляра.

  Существуют (определены в классе Module) также методы remove_method и undef_method.
  Разница между ними тонкая: remove_method удаляет текущее (или ближайшее) определение метода,
  a undef_method ко всему прочему удаляет его и из суперклассов, не оставляя от метода даже следа.
  Это различие иллюстрирует листинг 11.6.
=end

class Parent
  def alpha
    puts "alpha: родитель"
  end

  def beta
    puts "beta: родитель"
  end
end

class Child < Parent
  def alpha
    puts "alpha: потомок"
  end

  def beta
    puts "beta: потомок"
  end

  remove_method :alpha # Удалить "этот" alpha.
  undef_method :beta   # Удалить все beta.
end

x = Child.new
x.alpha               # alpha: родитель
x.beta                # Ошибка!

# Метод remove_const удаляет константу.

module Math
  remove_const :PI
end
# PI больше нет!

# Отметим, что таким способом можно удалить и определение класса (потому что идентификатор класса — это просто константа):

class BriefCandle
  #...
end

out_out = BriefCandle.new

class Object
  remove_const :BriefCandle
end

=begin
  Создать еще один экземпляр класса BriefCandle не получится!
  (Хотя out_out все еще существует...)

  Такие методы, как remove_const и remove_method, являются закрытыми (что и понятно).
  Поэтому во всех примерах они вызываются изнутри определения класса или модуля, а не снаружи.
=end
