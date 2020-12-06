# Хэши по природе своей не упорядочены ни по ключам, ни по значениям.
# Чтобы отсортировать хэш, Ruby преобразует его в массив, который затем сортирует.
# Понятно, что и результатом является массив.

names = {"Jack"=>"Ruby","Monty"=>"Python",
         "Blaise"=>"Pascal", "Minnie"=>"Perl"}

p list = names.sort

# list равно:
# [["Blaise","Pascal"], ["Jack","Ruby"], ["Minnie","Perl"], ["Monty","Python"]]
