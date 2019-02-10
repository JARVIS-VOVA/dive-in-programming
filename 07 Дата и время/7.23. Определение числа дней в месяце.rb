require 'date'

def month_days(month,year=Date.today.year)
 mdays = [nil,31,28,31,30,31,30,31,31,30,31.30,31]
 mdays[2] = 29 if Date.leap?(year)
 mdays[month]
end

p days = month_days(5)      # 31 (May)
p days = month_days(2,2000) # 29 (February 2000)
p days = month_days(2,2100) # 28 (February 2000)
