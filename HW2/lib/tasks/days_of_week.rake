task :days_of_week do
  today = Date.today
  days_from_this_week = (today.at_beginning_of_week..today.at_end_of_week).to_a
  days_from_this_week.each do |day|
    puts "#{day.strftime('%a, %m.%d.%Y')}"
  end
end
