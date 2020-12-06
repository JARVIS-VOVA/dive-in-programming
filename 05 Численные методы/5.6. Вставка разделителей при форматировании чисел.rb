def commas(x)
  str = x.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end

puts commas(123)     # "123"
puts commas(1234)    # "1,234"
puts commas(12345)   # "12,435"
puts commas(123456)  # "123,456"
puts commas(1234567) # "1,234,567"
