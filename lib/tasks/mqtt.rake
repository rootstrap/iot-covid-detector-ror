BROKER_URL = ENV['BROKER_URL']
MEASURES_TOPIC = ENV['MQTT_MEASURES_TOPIC']

task mqtt: :environment do
  MQTT::Client.connect(BROKER_URL) do |client|
    client.get(MEASURES_TOPIC) do |_, message|
      parsed_message = JSON.parse(message.gsub("'", '"'))
      device_id = parsed_message['device_id']
      p "Message from sensor ##{device_id}: #{parsed_message}"
      MeasureService.new(device_id).new_measure(parsed_message['value'].to_f)
    end
  end
end
