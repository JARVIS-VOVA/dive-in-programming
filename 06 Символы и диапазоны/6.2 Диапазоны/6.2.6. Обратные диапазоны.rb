string = "flowery"
p str1 = string[0..-2]  # "flower"
p str2 = string[1..-2]  # "lower"
p str3 = string[-5..-3] # "owe" (по существу, прямой диапазон)

r = 6..3
p r.to_a  # []
