# Для компиляции регулярных выражений предназначен метод Regexp.compile (синоним Regexp.new).

p pat1 = Regexp.compile("^foo.*") # /^foo.*/
p pat2 = Regexp.compile(/bar$/i)  # /bar/ (i не переносится)
