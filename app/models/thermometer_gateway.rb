class ThermometerGateway
  def self.temperature_for(thermometer)
    core = RubySpark::Core.new(thermometer.spark_core.device_id)
    core.variable("temperature")
  end
end
