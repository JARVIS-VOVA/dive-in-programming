# Метод collect из модуля Enumerable часто позволяет сэкономить время и силы.
# Тем, кто привык к языку Smalltalk, он покажется интуитивно очевидным в большей степени, чем программистам на С.

# Этот метод просто воздействует неким произвольным образом на каждый элемент массива, порождая в результате новый массив.
# Иными словами, он «отображает» один массив на другой (отсюда и синоним map).

x = %w[alpha bravo charlie delta echo foxtrot]

# Получить начальные буквы.
p a = x.collect {|w| w[0..0]}  # %w[a b с d e f]

# Получить длины строк.
p b = x.collect {|w| w.length} # [5, 5, 7, 5, 4, 7]

# map - просто синоним.
p с = x.map {|w| w.length}     # [5, 5, 7, 5, 4, 7]


# Имеется также вариант collect! (или map!) для модификации на месте.

p x.collect! {|w| w.upcase}
# x равно %w[ALPHA BRAVO CHARLIE DELTA ECHO FOXTROT]
p x.map! {|w| w.reverse}
# x равно %w[AHPLA OVARB EILRAHC ATLED OHCE TORTXOF]
