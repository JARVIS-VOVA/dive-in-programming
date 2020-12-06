=begin
  Метод const_missing аналогичен методу method_missing.
  При попытке обратиться к неизвестной константе вызывается этот метод — если он, конечно, определен.
  В качестве параметра ему передается символ, ссылающийся на константу.

  Чтобы перехватывать обращения к отсутствующим константам глобально, определите следующий метод в самом классе Module (это родитель класса Class).
=end

class Module
  def const_missing(x)
    "Из Module"
  end
end

class X
end

p X::BAR     # "Из Module"
p BAR        # "Из Module"
p Array::BAR # "Из Module"

# Если такая глобальность вам не нужна, определите этот метод на уровне конкретного класса.
# Тогда он будет вызываться из этого класса и его потомков.

class Alpha
  def self.const_missing(sym)
    "В Alpha нет #{sym}"
  end
end

class Beta
  def self.const_missing(sym)
    "В Beta нет #{sym}."
  end
end

class A < Alpha
end

class B < Beta
end

p Alpha::FOO # "В Alpha нет FOO"
p Beta::FOO  # "В Beta нет FOO"
p A::FOO     # "В Alpha нет FOO"
p B::FOO     # "В Beta нет FOO"
