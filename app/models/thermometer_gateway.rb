class ThermometerGateway
  def self.temperature_for(thermometer)
    core = Particle.device(thermometer.spark_core.device_id)
    core.variable("temperature")
  end
end
