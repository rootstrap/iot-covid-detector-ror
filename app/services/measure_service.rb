class MeasureService
  attr_reader :sensor

  def initialize(sensor_id)
    @sensor = Sensor.find_by(id: sensor_id)
  end

  def new_measure(value)
    Measure.create!(sensor: sensor, value: value) if sensor
  end
end
