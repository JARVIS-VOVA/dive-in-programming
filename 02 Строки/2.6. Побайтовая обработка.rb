str = "АВС"
str.each_byte { |byte| print byte, " " }
# Результат: 208 144 208 146 208 161

p '#'

str = "АВС"
str.each_char { |char| print char, " " }
# Результат: А В С

p '#'

str = "АВС"
p chars = str.scan(/./) # ["А", "В", "С"]
chars.each { |char| print char, " " }
# Результат: А В С
