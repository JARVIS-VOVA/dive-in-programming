# Иногда бывает нужно объединить хэши.
# Метод merge получает два хэша и формирует из них третий, перезаписывая обнаружившиеся дубликаты:

dict = {"base"=>"foundation", "pedestal"=>"base"}
added = {"base"=>"non-acid", "salt"=>"NaCl"}
p new_dict = dict.merge(added)
# {"base" =>"non-acid", "pedestal" =>"base", "salt"=>"NaCl"}

=begin
  У метода merge есть синоним update

  Если задан блок, то он может содержать алгоритм устранения коллизий.
  В нижеприведенном примере, если два ключа совпадают, в объединенном хэше остается меньшее значение
  (по алфавиту, по числовому значению или в каком-то ином смысле)
=end

dict = {"base"=>"foundation", "pedestal"=>"base"}
added = {"base"=>"non-acid", "salt"=>"NaCl"}
p new_dict = dict.merge(added) {|key,old,new| old < new ? old : new }
# {"salt"=>"NaCl", "pedestal"=>"base", "base"=>"foundation"}

# Таким образом, при использовании блока результат может получиться не такой, как в случае, когда блок не задан.
# Имеются также методы merge! и update!, которые изменяют вызывающий объект «на месте».
