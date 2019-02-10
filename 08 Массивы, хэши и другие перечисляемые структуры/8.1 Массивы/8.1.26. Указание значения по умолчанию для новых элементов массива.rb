a = Array.new
a[0]="x"
a[3]="y"
# а равно ["x", nil, nil, "y"]

# Но, допустим, нам требуется, чтобы новые элементы получали другое значение.
# Тогда в качестве конкретного применения общего принципа предлагаем класс ZArray, описывающий массив, в котором вновь созданные элементы будут равны 0

class ZArray < Array
  def [](x)
    if x > size
      for i in size+1..x
        self[i]=0
      end
    end
    v = super(x)
  end
  def []=(x,v)
    max = size
    super(x,v)
    if size - max > 1
      (max..size-2).each do |i|
        self[i] = 0
      end
    end
  end
end

num = ZArray.new
num[1] = 1
num[2] = 4
num[5] = 25

p num # [0, 1, 4, 0, 0, 25]
