p str1 = "\t \nabc \t\n"
p str2 = str1.strip  # "abc"
p str3 = str1.strip! # "abc"
#str1 теперь тоже равно "abc".

str = "
How are you?
"
p str # "\nHow are you?\n"
p str.strip # "How are you?"

# Чтобы удалить пропуски только в начале или только в конце строки, применяйте методы lstrip и rstrip

str = " abc "
p s2 = str.lstrip # "abc "
p s3 = str.rstrip # " abc"
