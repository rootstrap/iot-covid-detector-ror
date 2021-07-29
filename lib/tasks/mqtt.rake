task mqtt: :environment do
  MQTT::Client.connect('test.mosquitto.org') do |client|
    client.get('rs/covid-detector/sensor/+/measure') do |topic, message|
      sensor_id = topic.split('/')[3]
      parsed_message = JSON.parse(message)
      p "Message from sensor ##{sensor_id}: #{parsed_message}"
      MeasureService.new(sensor_id).new_measure(parsed_message['value'].to_f)
    end
  end
end
