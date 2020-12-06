s1 = "spam, spam, and eggs"
s2 = s1.sub(/spam/,"bacon") # "bacon, spam, and eggs"
s3 = s2.sub(/(w+), (w+),/,'2, 1,') # "spam, bacon, and eggs"

s4 = s1.gsub(/spam/,"bacon") # "bacon, bacon, and eggs"
