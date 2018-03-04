class Friend
  @@myname = "Эндрю"           # переменная класса

  def initialize(name, sex, phone)
    @name, @sex, @phone = name, sex, phone
    # Это переменные экземпляра
  end

  def hello # метод экземпляра
    puts "Привет, я #{@name}."
  end

  def Friend.our_common_friend # метод класса
    puts "Все мы друзья #{@@myname}."
  end
end

f1 = Friend.new("Сюзанна","F","555-0123")
f2 = Friend.new("Том","M","555-4567")
f1.hello                      # Привет, я Сюзанна.
f2.hello                      # Привет, я Том.
Friend.our_common_friend      # Все мы друзья Эндрю.

p '#'
p '#'
p '#'

class MyClass
  NAME = "Class Name"  # константа класса
  @@count = 0          # инициализировать переменную класса

  def initialize       # вызывается после выделения памяти для объекта
    @@count += 1
    @myvar = 10
  end

  def MyClass.getcount # метод класса
    @@count             # переменная класса
  end

  def getcount         # экземпляр возвращает переменную класса!
    @@count             # переменная класса
  end

  def getmyvar         # метод экземпляра
    @myvar              # переменная экземпляра
  end

  def setmyvar(val)    # метод экземпляра устанавливает @myvar
    @myvar = val
  end

  def myvar=(val)      # другой способ установить @myvar
    @myvar = val
  end
end

foo = MyClass.new # @myvar равно 10
foo.setmyvar 20 # @myvar равно 20
foo.myvar = 30 # @myvar равно 30

p foo   # <MyClass:0x0055bf9cc8a4b8 @myvar=30>

=begin   attr, attr _accessor, attr _reader и attr _ writer
  Здесь мы видим, что getmyvar возвращает значение переменной @myvar, а setmyvar
  устанавливает его. (Многие проfl)аммисты говорят о методах чтения и уста­
  новки). Все это работает, но не является характерным способом действий в Ruby.
  Метод myvar= похож на перегруженный оператор присваивания (хотя, строго го­
  воря, таковым не является); это более удачная ал1,тернатива setmyvar, но сеть спо­
  соб еще лучше.
  Класс Hodule содержит методы attr, attr _accessor, attr _reader и attr _ writer. Ими
  можно пользоваться (передавая символы в качестве параметров) для автома­
  тизации управления доступом к данным экземпляра. Например, все три метода
  getmyvar, setmyvar и myvar= можно заменить одной строкой в определении класса:
  attr_accessor :myvar
  При этом создается метод myvar, который возвращает значение @myvar, и метод
  myvar = , который позволяет изменить значение той же переменной. Методы attr
  reader и attr _ writer создают соответственно версии методов доступа к атрибуту дл;
  чтения и для изменения.
=end

p '#'
p '#'
p '#'

# private, protected и puЫic.

class MyClass
  def methodl
    # ...
  end

  def method2
    # ...
  end

  def methodЗ
    # ...
  end

  private :methodl

  public

  :method2

  protected :methodЗ

  private

  def my_method
    # ...
  end

  def another method
    # ...
  end
end

=begin
  В этом классе метод methodl закрытый, method2 открытый, а methodЗ защищенный.
  Поскольку далее вызывается метод pri vate без параметров, то методы my - method
  и another _ method будут закрытыми.
  Уровень доступа pu:Clic не нуждается в объяснениях, он не налагает никаких
  ограничений ни на доступ к методу, ни на его видимость. Уровень pri vate означает,
  что метод доступен только внутри класса или его подклассов и может вызывать­
  ся только в «функциональной форме� от имени self, причем вызывающий объект
  может указываться явно или подразумеваться неявно. Уровень protected означает,
  что метод может вызываться только внутри класса, но в отличие от закрытого ме­
  тода, не обязательно от имени self.
=end
