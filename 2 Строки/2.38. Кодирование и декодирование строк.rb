# Префикс uu в этих именах означает UNIX-to-UNIX.
# Утилиты uuencode и uudecode — это проверенный временем способ обмена данными в текстовой форме (аналогичный base64).

str = "070702abdce"
p new_string = [str].pack("u")      # '(P<"!V)D8V4''
p original = new_string.unpack("u") # ["aa02abdce"]

# Отметим, что метод unpack возвращает массив.
