p t0 = Time.local(2000,11,10,22,15) # 2000-11-10 22:15:00 +0200
p t1 = Time.local(2000,11,9,23,45)  # 2000-11-09 23:45:00 +0200
p t2 = Time.local(2000,11,12,8,10)  # 2000-11-12 08:10:00 +0200
p t3 = Time.local(2000,11,11,10,25) # 2000-11-11 10:25:00 +0200

if t0 < t1 then puts "t0 < t1" end
if t1 != t2 then puts "t1 != t2" end
if t1 <= t2 then puts "t1 <= t2" end
if t3.between?(t1,t2)
 puts "t3 находится между t1 и t2"
end
# Все четыре предложения if возвращают true.
