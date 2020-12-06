# В классе Array есть метод pack, который возвращает строку в кодировке base64 (если передать ему параметр "m").
# А в классе string есть метод unpack

str = "070702abdce"
p new_string = [str].pack("m")      # "BwcCB2JkY2U="
p original = new_string.unpack("m") # ["aa02abdce"]
