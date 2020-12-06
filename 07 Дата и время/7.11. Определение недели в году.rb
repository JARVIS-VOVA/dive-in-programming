# Спецификатор %U отсчитывает недели, начинающиеся с воскресенья, а спецификатор %W — начинающиеся с понедельника.
require 'date'

t2 = Time.local(2002,5,1)
d2 = Date.new(2002,5,1)

p week2a = t2.strftime("%U").to_i # 18
p week2b = t2.strftime("%W").to_i # 18
p week2c = d2.cweek               # 17
