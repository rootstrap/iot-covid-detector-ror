#include <ESP8266WiFi.h>
#include <PubSubClient.h>

const char *ssid = 'ssid';
const char *password = 'password';

const char *mqtt_server = 'mqtt_server';

WiFiClient espClient;
PubSubClient client(espClient);

string deviceId;
long lastMsg = 0;
int sensorValue;

void setup()
{
  Serial.begin(9600);

  setup_wifi();

  getDeviceId();
  client.setServer(mqtt_server, 1883);
}

void getDeviceId()
{
  deviceId = String(ESP.getChipId(), HEX);
}

void setup_wifi()
{
  delay(1000);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
  }
}

void reconnect()
{
  while (!client.connected())
  {
    if (client.connect("ESP822Client-"))
    {
      client.subcribe("rs/covid-detector/measure");
    }
    delay(500);
  }
}

void loop()
{
  if (!client.connected())
  {
    reconnect()
  }
  client.loop();

  sensorValue = analog_read(0);
  message = "{ device_id: " + deviceId + ", mesure: " + sensorValue + " }";
  client.publish("rs/covid-detector/measure", message);
}
