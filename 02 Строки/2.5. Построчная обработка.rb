p str = %w[Когда-то давным-давно]
num = 0

str.each do |line|
  num += 1
  p "Строка #{num}: #{line}"
end

# "Строка 1: Когда-то"
# "Строка 2: давным-давно"

p '#'

str = "Когда-то давным-давно ... Конец"
num = 0

str.each_line.with_index do |line, nun|
  p "Строка #{num + 1}: #{line}"
end

# "Строка 1: Когда-то давным-давно ... Конец"
