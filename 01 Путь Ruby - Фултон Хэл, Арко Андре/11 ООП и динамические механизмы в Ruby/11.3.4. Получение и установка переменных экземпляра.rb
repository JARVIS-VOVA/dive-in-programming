# В Ruby включены методы, которые могут получить или присвоить новое значение переменной экземпляра, имя которой задано в виде строки:

class MyClass
 attr_reader :alpha, :beta
 def initialize(a,b,g)
  @alpha, @beta, @gamma = a, b, g
 end
end

x = MyClass.new(10,11,12)
x.instance_variable_set("@alpha", 234)

p x.alpha # 234

x.instance_variable_set("@gamma", 345) # 345
v = x.instance_variable_get("@gamma") # 345

p v
