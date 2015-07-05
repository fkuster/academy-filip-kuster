task :new_york do
  today = Date.today
  days_from_this_week = (today.at_beginning_of_week..today.at_end_of_week).to_a
  days_from_this_week.each do |day|
    puts "#{day.strftime('%a, %m.%d.%Y')}"
  end
  puts "Time in New York: #{Time.now.in_time_zone('America/New_York').strftime('%a, %m %d %Y %H:%M:%I %Z %z')}"
end
