class MyClass
  @alpha = 123          # Инициализировать @alpha.

  class << self
    attr_reader :alpha   # MyClass.alpha()
    attr_writer :beta    # MyClass.beta=()
    attr_accessor :gamma # MyClass.gamma() и
  end
                    # MyClass.gamma=()
  def MyClass.look
    p "#@alpha, #@beta, #@gamma"
  end
end

p MyClass.alpha # 123
MyClass.beta = 456
MyClass.gamma = 789
p MyClass.gamma # 789
MyClass.look       # 123, 456, 789
