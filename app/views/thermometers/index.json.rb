@thermometers.map do |thermometer|
  {
    "id" => thermometer.id,
    "room" => thermometer.room
  }
end.to_json
