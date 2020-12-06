# Можно ли узнать, был ли параметр задан вызывающей программой или взято значение по умолчанию?

def meth(a, b=(flag=true; 345))
  p "b равно #{b}, a flag равно #{flag.inspect}"
end

p meth(123)     # b равно 345, a flag равно true
p meth(123, 345) # b равно 345, a flag равно nil
p meth(123, 456) # b равно 456, a flag равно nil
