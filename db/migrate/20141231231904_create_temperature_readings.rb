class CreateTemperatureReadings < ActiveRecord::Migration
  def change
    create_table :temperature_readings do |t|
      t.decimal :temperature, :precision => 7, :scale => 4
      t.timestamps null: false
    end
  end
end
