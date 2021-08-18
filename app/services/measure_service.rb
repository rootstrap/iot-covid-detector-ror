class MeasureService
  attr_reader :sensor

  def initialize(device_id)
    @sensor = Device.find_by(external_id: device_id)&.sensors&.first
  end

  def new_measure(value)
    Measure.create!(sensor: sensor, value: value) if sensor
  end
end
