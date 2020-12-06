# each

=begin
  Метод reverse_each обходит массив в обратном порядке.
  Результат такой же, как если бы мы вызвали сначала метод reverse, а потом each, но работает быстрее.
=end

words = %w(Son I am able she said)
str = ""
words.reverse_each { |w| str += "#{w} "}
p str # str равно "said she able am I Son "

=begin
  Если нужно только перебрать все индексы, можно воспользоваться итератором each_index
  Конструкция x.each_index эквивалентна (0..(x.size-1)).each (то есть обходу всего диапазона индексов).

  Итератор each_with_index (подмешанный из модуля Comparable) передает в блок как сам элемент, так и его индекс.
=end

x = ["alpha", "beta", "gamma"]
x.each_with_index do |x,i|
 puts "Элемент #{i} равен #{x}"
end
# Выводятся три строки.

=begin
  Предположим, что нужно обойти массив в случайном порядке.
  Ниже представлен итератор random_each (который просто вызывает метод randomize, описанный в разделе 8.1.10).
=end

class Array
 # Предполагается, что метод randomize определен.
  def random_each
    temp = self.randomize
    temp.each { |x| yield x }
  end

  def randomize
    self.sort_by { rand }
  end
end

dwarves = %w(Sleepy Dopey Happy Sneezy Grumpy Bashful Doc)
list = ""
dwarves.random_each {|x| list += "#{x} "}
p list  # "Bashful Dopey Sleepy Happy Grumpy Doc Sneezy "
        # (Ha вашей машине порядок может быть другим.)
