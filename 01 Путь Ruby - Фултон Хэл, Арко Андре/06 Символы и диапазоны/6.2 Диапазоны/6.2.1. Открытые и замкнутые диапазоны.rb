# Диапазон называется замкнутым, если включает конечную точку, и открытым — в противном случае

p r1 = 3..6    # Замкнутый.
p r2 = 3...6   # Открытый.
p a1 = r1.to_a # [3,4,5,6]
p а2 = r2.to_a # [3,4,5]
