task :new_york => :days_of_week do

  puts "Time in New York: #{Time.now.in_time_zone('America/New_York').strftime('%a, %m %d %Y %H:%M:%I %Z %z')}"
end
