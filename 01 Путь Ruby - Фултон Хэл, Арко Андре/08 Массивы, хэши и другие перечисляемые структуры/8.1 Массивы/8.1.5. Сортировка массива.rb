words = %w(the quick brown fox)
p list = words.sort # ["brown", "fox", "quick", "the"]
# Или отсортировать на месте:
p words.sort!       # ["brown", "fox", "quick", "the"]

# Здесь предполагается, что все элементы массива сравнимы между собой.
# При сортировке неоднородного массива, например [1, 2, "tHRee", 4], обычно возникает ошибка.

# В подобных случаях можно воспользоваться также блочной формой того же метода.
# Ниже предполагается, что у каждого элемента есть хотя бы метод to_s (преобразующий его в строку):

a = [1, 2, "three", "four", 5, 6]
p b = a.sort {|x,y| x.to_s <=> y.to_s} # b равно [1, 2, 5, 6, "four", "three"]

# Чтобы отсортировать массив по убыванию, достаточно все го лишь изменить порядок сравнения:

x = [1, 4, 3, 5, 2]
p y = x.sort { |a,b| b <=> a } # [5, 4, 3, 2, 1]

# Блоки можно применять и для более сложных сортировок.
# Предположим, что нужно отсортировать названия книг и фильмов следующим способом: регистр игнорируется, полностью игнорируются пробелы, а также ряд знаков препинания и артикли.
# Ниже приведен простой пример (и преподаватели английского языка, и программисты будут удивлены таким способом упорядочения по алфавиту).

titles = ["Starship Troopers",
          "A Star is Born",
          "Star Wars",
          "Star 69",
          "The Starr Report"]

sorted = titles.sort do |x, y|
  # Удалить артикли
  a = x.sub(/"(a |an |the )/i, "")
  b = y.sub(/"(a |an |the )/i, "")
  # Удалить пробелы и знаки препинания
  a.delete!(" .,-?!")
  b.delete!(" .,-?!")
  # Преобразовать в верхний регистр
  a.upcase!
  b.upcase!
  # Сравнить а и b
  a <=> b
end

p sorted    # [ "Star 69", "A Star is Born", "The Starr Report", "Starship Troopers", "Star Wars"]

=begin
  Данный пример не слишком полезен и, конечно, его можно было бы записать более компактно.
  Но идея в том, что для сравнения двух операндов в определенном порядке над ними можно выполнять произвольно сложный набор операций.
  (Отметим, однако, что мы не изменили исходные операнды, так как работали с их копиями.)
  Эта общая техника полезна во многих ситуациях, например для сортировки по нескольким ключам или по ключам, вычисляемым во время выполнения.

  В последних версиях Ruby в модуль Enumerable добавлен метод sort_by (который, конечно, подмешивается к классу Array).
  Важно понимать, что он делает.

  В методе sort_by применяется то, что программисты на Perl называют преобразованием Шварца — в честь Рэндала Шварца (Randal Schwartz), внесшего немалый вклад в развитие этого языка.
  Вместо того чтобы сортировать сами элементы массива, мы применяем к ним некоторую функцию и сортируем возвращаемые ей результаты.

  В качестве искусственного примера рассмотрим список файлов, который необходимо отсортировать по размеру.
  Прямолинейный способ выглядит так:

  files = files.sort {|x,y| File.size(x) <=> File.size(y) }

  Однако тут есть две проблемы. Во-первых, слишком многословно. Надо бы сделать покомпактнее.

  Во-вторых, при такой сортировке приходится многократно обращаться к диску, а это довольно дорогая операция (по сравнению с операциями в оперативной памяти).
  Хуже того, одна и та же операция может выполняться несколько раз.

  Метод sort_by решает обе проблемы. Вот «правильный» способ:

  files = files.sort_by {|x| File.size(x) }

  Здесь каждый ключ вычисляется ровно один раз, а затем сохраняется в виде пары ключ-данные.
  Для небольших массивов производительность при таком подходе может даже снизиться, зато код получается более понятным.

  А как обстоит дело с сортировкой по нескольким ключам?
  Предположим, что имеется массив объектов, который нужно отсортировать по трем атрибутам: имени, возрасту и росту.
  Из того, что массивы можно сравнивать, следует, что такое решение будет работать:

  list = list.sort_by {|x| [x.name, x.age, x.height] }
=end
