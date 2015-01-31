class TemperatureReadingsQuery
  PATTERNS = {
    :hour => "%Y-%m-%dT%H",
    :day => "%Y-%m-%d"
  }

  TIMEFRAMES = {
    :hour => 1.hour.ago,
    :day => 1.day.ago,
    :week => 1.week.ago,
    :month => 1.month.ago
  }

  def initialize(thermometer, start_date = 1.month.ago)
    @readings = fetch_readings(thermometer, start_date)
  end

  def avg_temp_grouped_by(unit = :hour)
    pattern = PATTERNS[unit]
    readings_by_unit = @readings.group_by { |r| r.created_at.strftime(pattern) }
    avg_temp_by_unit = readings_by_unit.transform_values do |v|
      (v.collect(&:temperature).inject(0.0) { |sum, temp| sum + temp } / v.size)
    end
  end

  def fetch_readings(thermometer, start_date)
    thermometer.temperature_readings
      .where("created_at > ?", start_date)
  end
end
