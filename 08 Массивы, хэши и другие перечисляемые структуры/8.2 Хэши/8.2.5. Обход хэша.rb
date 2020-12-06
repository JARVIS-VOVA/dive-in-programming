# В классе Hash имеется стандартный итератор each, а кроме него итераторы each_key, each_pair и each_value(each_pair — синоним each).

{"а"=>3, "b"=>2}.each do |key, val|
  print val, " из ", key, "; " # 3 из a; 2 из b;
end

# Остальные два итератора передают в блок только ключ или только значение
p '#'

{"а"=>3, "b"=>2}.each_key do |key|
  print "ключ = #{key};" # Печатается: ключ = a; key = b;
end

p '#'

{"a"=>3, "b"=>2}.each_value do |value|
  print "значение = #{value};" # Печатается: значение = 3; val = 2;
end

p '#'
