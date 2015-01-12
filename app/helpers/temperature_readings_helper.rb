module TemperatureReadingsHelper
  def convert_celsius_to_fahrenheit(temp_in_c)
    ((temp_in_c * 9/5) + 32).round(1)
  end
end
