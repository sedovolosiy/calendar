require 'date'

CALENDAR_WIDTH = 20

def print_calendar(year, month)
  date = Date.new(year, month)
  puts date.strftime("%B %Y").center(CALENDAR_WIDTH)
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)

  pre_days = Array.new(first_day.wday, "  ")

  date_range = (first_day..last_day).to_a

  total_days = pre_days + date_range.map { |d| d.day.to_s.rjust(2) }
  post_days_padding = Array.new((7 - total_days.size % 7) % 7, "  ")
  calendar_days = total_days + post_days_padding

  puts "Su Mo Tu We Th Fr Sa"
  calendar_days.each_slice(7) { |week| puts week.join(" ")}
end

if ARGV.size == 2
  year, month = ARGV.map(&:to_i)
  print_calendar(year, month)
else
  year = Date.today.year.to_i
  month = Date.today.month.to_i
  print_calendar(year, month)
end
