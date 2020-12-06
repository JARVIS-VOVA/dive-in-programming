# Для обращения строки служит метод reverse (или его вариант для обращения «на месте» reverse!

s1 = "Star Trek"
s2 = s1.reverse # "kerT ratS"
p s1.reverse!     # si теперь равно "kerT ratS"

=begin
  Пусть требуется обратить порядок слов (а не символов).
  Тогда можно сначала воспользоваться методом String#split , который вернет массив слов.
  В классе Array тоже есть метод reverse , поэтому можно обратить массив,
  а затем с помощью метода join объединить слова в новую строку:
=end

phrase = "Now here's a sentence"
phrase = phrase.split(" ").reverse.join(" ")
p phrase # "sentence a here's Now"
