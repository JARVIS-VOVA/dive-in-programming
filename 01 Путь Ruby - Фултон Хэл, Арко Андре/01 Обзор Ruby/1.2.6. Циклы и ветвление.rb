=begin
  следующие два предложения эквивалентны:
  if х < 5 then
    statementl
  unless х >= 5 then
    statementl

  И эти два тоже:
  if х < 5 then
    statementl
  else
    statement2
  end

  unless х < 5 then
    statement2
  else
    statementl
  end

  и эти:
  statementl if у == 3
  statementl unless у != 3

  и вот эти:
  х = if а > О then Ь else с end
  х = unless а <= О then с else Ь end
=end

list = %w[alpha bravo charlie delta echo]

# Цикл 1 (while)
i = 0
while i < list.size do
  print "#{ list[i]} "
  i += 1
end

# Цикл 2 (until)
i = 0
until i == list.size do
  print "#{list[i]} "
  i += 1
end

# Цикл 3 (while с проверкой в конце)
i = 0
begin
  print "#{list[i]} "
  i += 1
end while i < list.size

# Цикл 4 (until с проверкой в конце)
i = 0
begin
  print "#{list[i]} "
  i += 1
end until i == list.size

# Цикл 5 (for)
for х in list do
  print "#{х} "
end

# Цикл 6 (итератор 'each')
list.each do |x|
  print #{х) "
end

# Цикл 7 (метод 'loop')
i = 0
n = list.size-1
loop do
  print #{list[i])
  i += 1
  break if i > n
end

# Цикл 8 (метод 'loop')
i = 0
n = list. size-1
loop do
  print "#{list[i]} "
  i += 1
  break unless i <= n
end

# Цикл 9 (итератор 'times')
n = list.size
n.times do |i|
  print "#{list[i]}"
end

# Цикл 10 (итератор 'upto')
n = list.size-1
0.upto(n) do |i|
  print "#{list[i]}"
end

# Цикл 11 (for)
n = list.size-1
for
  i in 0..n do
  print "#{list[i]} "
end

# цикл 12 (итератор 'each_index')
list.each_index do |x|
  print "#{list[x]} "
end

# yield
def my_sequence
  (1..10).each do |i|
    yield i    # 8 27 64...
  end
end

my_sequence { |x| puts x**3 }
