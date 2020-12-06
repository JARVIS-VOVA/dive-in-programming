droid = "R2D2"
p improved = droid.succ # "R2D3"
pill = "Vitamin B"
p pill2 = pill.succ     # "Vitamin C"

# upto, который в цикле вызывает succ

"Files, A".upto "Files, X" do | letter |
 puts "Opening: #{letter}"
end

# Выводится 24 строки.
