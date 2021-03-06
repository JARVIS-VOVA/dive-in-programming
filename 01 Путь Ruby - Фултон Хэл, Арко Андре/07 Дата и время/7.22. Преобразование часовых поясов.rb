=begin
  Обычно приходится работать только с двумя часовыми поясами: GMT (или UTC) и тем, в котором вы находитесь.

  Метод gmtime преобразует время к поясу GMT (модифицируя сам вызывающий объект). У него есть синоним utc.

  Может быть, вы думаете, что можно просто преобразовать момент времени в массив, подменить часовой пояс и выполнить обратное преобразование?
  Проблема в том, что все методы класса, к примеру local и gm (а также их синонимы mktime и utc),
  готовы создавать объект Time только в предположении, что указано либо местное время, либо время по Гринвичу.

  Есть обходной путь для преобразования часового пояса.
  Но предполагается, что вы заранее знаете разницу во времени. Взгляните на следующий фрагмент
=end

p mississippi = Time.local(2000,11,13,9,35) # 9:35 am CST
p california = mississippi - 2*3600         # Минус два часа.
p time1 = mississippi.strftime("%X CST")    # 09:35:00 CST
p time2 = california.strftime("%X PST")     # 07:35:00 PST

# Спецификатор %x в методе strftime просто выводит время в формате hh:mm:ss
