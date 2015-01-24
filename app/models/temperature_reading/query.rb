class TemperatureReading::Query
  def self.for(thermometer)
    @thermometer = thermometer
  end

  def since(date)
    thermometer.temperature_readings
      .where("created_at > ?", date)
      .order("created_at desc")
  end
end
