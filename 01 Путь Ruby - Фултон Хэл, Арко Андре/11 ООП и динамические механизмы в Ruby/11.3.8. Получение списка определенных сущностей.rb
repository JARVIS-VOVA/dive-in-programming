=begin
  API отражения в Ruby позволяет опрашивать классы и объекты во время выполнения.
  Рассмотрим методы, имеющиеся для этой цели в Module, Class и Object.

  В модуле Module есть метод constants, который возвращает массив всех констант,
  определенных в системе (включая имена классов и модулей).
  Метод nesting возвращает массив всех вложенных модулей, видимых в данной точке программы.

  Метод экземпляра Module#ancestors возвращает массив всех предков указанного класса или модуля.
=end

list = Array.ancestors
# [Array, Enumerable, Object, Kernel]

=begin
  Метод constants возвращает список всех констант, доступных в данном модуле.
  Включаются также его предки.
=end

list = Math.constants # ["E", "PI"]

=begin
  Метод class_variables возвращает список всех переменных класса в данном классе и его суперклассах.
  Метод included_modules возвращает список модулей, включенных в класс.
=end

class Parent
  @@var1 = nil
end

class Child < Parent
  @@var2 = nil
end

list1 = Parent.class_variables # ["@@var1"]
list2 = Array.included_modules # [Enumerable, Kernel]

=begin
  Методы instance_methods и public_instance_methods класса Class — синонимы;
  они возвращают список открытых методов экземпляра, определенных в классе.
  Методы private_instance_methods и protected_instance_methods ведут себя аналогично.
  Любой из них принимает необязательный булевский параметр, по умолчанию равный true;
  если его значение равно false, то суперклассы не учитываются, так что список получается меньше.
=end

n1 = Array.instance_methods.size               # 121
n2 = Array.public_instance_methods.size        # 121
n3 = Array.private_instance_methods.size       # 71
n4 = Array.protected_instance_methods.size     # 0
n5 = Array.public_instance_methods(false).size # 71

=begin
  В классе Object есть аналогичные методы, применяющиеся к экземплярам (листинг 11.17).
  Метод methods возвращает список всех методов, которые можно вызывать для данного объекта.
  Метод public_methods возвращает список открытых методов и принимает параметр, равный по умолчанию true,
  который говорит, нужно ли включать также методы суперклассов.
  Методы private_methods,
  protected_methods и singleton_methods тоже принимают такой параметр.
=end

class SomeClass
  def initialize
    @a = 1
    @b = 2
  end

  def mymeth
    # ...
  end

  protected :mymeth
end

x = SomeClass.new

def
  x.newmeth
  # ...
end

iv = x.instance_variables       # ["@b", "@a"]
p x.methods.size                # 42
p x.public_methods.size         # 41
p x.public_methods(false).size  # 1
p x.private_methods.size        # 71
p x.private_methods(false).size # 1
p x.protected_methods.size      # 1
p x.singleton_methods.size      # 1

# Если вы работаете с Ruby уже несколько лет, то заметите, что эти методы немного изменились.
# Теперь параметры по умолчанию равны true, а не false
