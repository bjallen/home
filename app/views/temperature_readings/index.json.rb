@avg_temp_by_time.map do |hour, temp|
  {
    "time" => Time.strptime(hour, "%Y-%m-%dT%H").iso8601,
    "celcius" => temp.to_s,
    "fahrenheit" => convert_celsius_to_fahrenheit(temp).to_s
  }
end.to_json
