=begin
  Глобальная функция eval компилирует и исполняет строку, содержащую код на Ruby.

  В Ruby есть еще три метода, которые интерпретируют код «на лету»:
  class_eval, module_eval и instance_eval.
  Первые два — синонимы, и все они выполняют одно и то же: интерпретируют строку или блок, но при этом изменяют значение псевдопеременной
  self так, что она указывает на объект, от имени которого эти методы вызваны.

  Наверное, чаще всего метод class_eval применяется для добавления методов в класс, на который у вас имеется только ссылка.
  Мы продемонстрируем это в коде метода hook_method в примере утилиты Trace в разделе 11.3.13.
=end
