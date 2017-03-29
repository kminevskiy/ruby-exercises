#!/bin/ruby

time = gets.strip
letters = time[-2..-1]
time_stripped = time.sub(time[-2..-1], '')
hours = time[0..1].to_i
pm_hours = (hours + 12).to_s

if letters == 'AM' && hours == 12
  puts(time_stripped.sub(time[0..1], '00'))
elsif letters == 'PM' && hours == 12
  puts(time_stripped)
elsif letters == 'AM' && hours < 12 && hours[0] != 0
  puts(time_stripped.sub(time[0], ''))
elsif letters == 'AM' && hours < 12
  puts(time_stripped)
elsif letters == 'PM' && hours < 12
  puts(time_stripped.sub(time[0..1], pm_hours))
end

# 07:45:41AM -> 7:45:41  (0)
# 10:12:31AM -> 10:12:31 (0)
# 07:45:41PM -> 19:45:41 (+12)
# 12:00:00AM -> 00:00:00 (-12) +
# 12:00:00PM -> 12:00:00 (+0) _