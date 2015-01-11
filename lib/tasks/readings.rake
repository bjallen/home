namespace :readings do
  task :read_room_two_temp => :environment do
    thermometers = Thermometer.all
    thermometers.each do |thermometer|
      reading = Thermometer.temperature_readings.build
      reading.temperature = ThermometerGateway.temperature_for(thermometer)
      if reading.temperature.nil?
        Rails.logger.error response.body
      else
        reading.save!
      end
    end
  end
end
