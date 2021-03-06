# Метод delete удаляет из строки те символы, которые включены в список, переданный в качестве параметра:

s1 = "To be, or not to be"
p s2 = s1.delete("b")  # "To e, or not to e"
s3 = "Veni, vidi, vici!"
p s4 = s3.delete(",!") # "Veni vidi vici"

=begin
  Этот параметр подчиняется тем же правилам, что и параметр метода count (см. раздел 2.28),
  то есть допускаются символы - (дефис) и ^ (каре).
  Имеется также метод delete!
=end
