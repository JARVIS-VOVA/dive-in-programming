# Часто требуется вставить разделители между элементами массива, но не перед первым и не после последнего.
# Для этого предназначены метод join и оператор *

been_there = ["Veni", "vidi", "vici."]
p journal = been_there.join(", ") # "Veni, vidi, vici."

letters = ["Phi","Mu","Alpha"]
p musicians = letters.join(" ")   # "Phi Mu Alpha"

people = ["Bob","Carol","Ted","Alice"]
p movie = people * " and "
# movie равно "Bob and Carol and Ted and Alice"

# Если необходимо обрабатывать последний элемент особым образом, например вставить перед ним слово «and», это можно сделать вручную:

list = %w[A В С D Е F]
p with_commas = list[0..-2]*", " + ", and " + list[-1]
# with_commas равно "А, В, C, D, E, and F"
