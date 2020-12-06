# Существует также метод key?, который сообщает, используется ли указанное имя в данном потоке.

thread = Thread.new do
  t = Thread.current
  t[:var1] = "Это строка"
  t[:var2] = 365
end

# Доступ к локальным данным потока извне...

x = thread[:var1]              # "Это строка"
y = thread[:var2]              # 365

has_var2 = thread.key?("var2") # true
has_var3 = thread.key?("var3") # false
