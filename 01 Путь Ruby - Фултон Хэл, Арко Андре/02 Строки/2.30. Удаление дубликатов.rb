# Цепочки повторяющихся символов можно сжать до одного методом squeeze

s1 = "bookkeeper"
p s2 = s1.squeeze # "bokeper"
s3 = "Hello..."
p s4 = s3.squeeze # "Helo."

# Если указан параметр, то будут удаляться только дубликаты заданных в нем символов:

p s5 = s3.squeeze(".") # "Hello."

# Этот параметр подчиняется тем же правилам, что и параметр метода count, то есть допускаются дефис и символ ^.
# Имеется также метод squeeze!
