text = %w[the magic words are squeamish ossifrage]
dictionary = %w[an are magic the them these words]

# Найти неправильно написанные слова
p unknown = text - dictionary # ["squeamish", "ossifrage"]
