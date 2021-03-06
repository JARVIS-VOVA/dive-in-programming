=begin
  В Ruby есть три основных класса для работы с датами и временем: Time , Date и DateTime . Опишем их особенности:

  • Класс Time преимущественно обертывает соответствующие функции из стандартной библиотеки языка С.
  Они, как правило, опираются на точку отсчета в UNIX и потому не способны представлять моменты времени раньше 1970 года.

  • Класс Date создан для преодоления недостатков класса Time.
  Он без труда справляется с датами в более отдаленном прошлом — например, позволяет представить день рождения Леонардо да Винчи (15 апреля 1452 года), и, кроме того, знает о реформе календаря.
  Но у него есть свои слабые места: он работает только с датами, игнорируя время.

  • Класс DateTime наследует Date и пытается компенсировать отсутствующие в нем возможности. Он может представлять даты не хуже Date и время не хуже Time.
  Часто его способ представления даты и времени оказывается наилучшим.

  Однако не думайте, что объект DateTime — это просто объект Date, к которому механически присоединен объект Time.
  На самом деле в классе DateTime отсутствуют такие методы, как usec, dst? и некоторые другие.

  Итак, у нас есть три класса. К сожалению, не существует стандартного способа преобразовать один из них в любой другой.
=end
