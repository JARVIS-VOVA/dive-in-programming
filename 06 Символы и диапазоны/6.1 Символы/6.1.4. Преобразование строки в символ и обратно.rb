a = "foobar"
b = :foobar

p a == b.to_str # true
p b == a.to_sym # true
