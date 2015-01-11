class AddThermometerToTemperatureReadings < ActiveRecord::Migration
  def change
    add_reference :temperature_readings, :thermometer, index: true
    add_foreign_key :temperature_readings, :thermometers
  end
end
