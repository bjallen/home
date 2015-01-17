@avg_temp_by_time.map do |hour, temp|
 "convert_celsius_to_fahrenheit(temp).to_s °F" => "#{Time.strptime(hour, "%Y-%m-%dT%H").strftime("%I:%M %p, %A %b %d %Y")}"
end.to_json
