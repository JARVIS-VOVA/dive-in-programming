# uniq || uniq!

breakfast = %w[spam spam eggs ham eggs spam]
p lunch = breakfast.uniq # ["spam","eggs","ham"]
p breakfast.uniq! # Массив breakfast изменился.
