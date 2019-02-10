str = "Albert Einstein"
pos1 = str.index(?E)     # 7
pos2 = str.index("bert") # 2
pos3 = str.index(/in/)   # 8
pos4 = str.index(?W)     # nil
pos5 = str.index("bart") # nil
pos6 = str.index(/Wein/) # nil

# rindex начинает поиск с конца строки. Но номера позиций отсчитываются тем не менее от начала:

str = "Albert Einstein"
pos1 = str.rindex(?E)     # 7
pos2 = str.rindex("bert") # 2
pos3 = str.rindex(/in/)   # 13 (найдено самое правое соответствие)
pos4 = str.rindex(?W)     # nil
pos5 = str.rindex("bart") # nil
pos6 = str.rindex(/wein/) # nil

# Метод include? сообщает, встречается ли в данной строке указанная подстрока или один символ:

str1 = "mathematics"
flag1 = str1.include? ?e        # true
flag2 = str1.include? "math"    # true
str2 = "Daylight Saving Time"
flag3 = str2.include? ?s        # false
flag4 = str2.include? "Savings" # false

# Метод scan многократно просматривает строку в поисках указанного образца.
# Будучи вызван внутри блока, он возвращает массив.
# Если образец содержит несколько (заключенных в скобки) групп, то массив окажется вложенным:

str1 = "abracadabra"
sub1 = str1.scan(/а./)
# sub1 теперь равно ["ab","ас","ad","ab"]
str2 = "Acapulco, Mexico" 
