# Массив нужен для того, чтобы ассоциировать целое число (индекс) с данными.
# А если нужно инвертировать это отношение, то есть ассоциировать данные с индексом?
# Иными словами, породить хэш? Это можно сделать так

class Array
  def invert
    h={}
    self.each_with_index{|x,i| h[x]=i}
    h
  end
end

a = ["red","yellow","orange"]
p h = a.invert # {"red"=>0, "yellow"=>1, "orange"=>2}
