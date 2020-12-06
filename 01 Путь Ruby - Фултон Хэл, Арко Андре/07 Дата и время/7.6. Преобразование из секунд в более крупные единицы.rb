def sec2dhms(seсs)
 time = seсs.round           # Отбрасываем микросекунды.
 sec = time % 60             # Извлекаем секунды.
 time /= 60                  # Отбрасываем секунды.
 mins = time % 60            # Извлекаем минуты.
 time /= 60                  # Отбрасываем минуты.
 hrs = time % 24             # Извлекаем часы.
 time /= 24                  # Отбрасываем часы.
 days = time                 # Дни (последний остаток).
 [days, hrs, mins, sec]      # Возвращаем массив [d,h,m,s].
end

t = sec2dhms(1000000)        # Миллион секунд равно...
puts "#{t[0]} days,"         # 11 дней,
puts "#{t[1]} hours,"        # 13 часов,
puts "#{t[2]} minutes,"      # 46 минут
puts " and #{t[3]} seconds." # и 40 секунд.

# Ниже приведена также обратная функция:

def dhms2sec(days,hrs=0,min=0,sec=0)
  days*86400 + hrs*3600 + min*60 + sec
end

p dhms2sec(t[0], t[1], t[2], t[3]) # Миллион секунд равно...
