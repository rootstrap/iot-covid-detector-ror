class PublishMqttService
  attr_reader :client, :message

  BROKER_URL = ENV['BROKER_URL']
  MEASURES_TOPIC = ENV['MQTT_MEASURES_TOPIC']

  def initialize(message)
    @message = message
    @client = MQTT::Client.connect(BROKER_URL)
  end

  def publish
    client.publish(MEASURES_TOPIC, payload, false)
  end

  private

  def payload
    @payload = { data: message }.to_json
  end
end
