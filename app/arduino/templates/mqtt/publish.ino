#include <ESP8266WiFi.h>
#include <PubSubClient.h>

const char *ssid = 'ssid';
const char *password = 'password';

const char *mqtt_server = 'mqtt_server';

WiFiClient espClient;
PubSubClient client(espClient);

long lastMsg = 0;
int sensorValue;

void setup()
{
  Serial.begin(9600);

  setup_wifi();

  client.setServer(mqtt_server, 1883);
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
      client.subcribe("covid19-detector");
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
  client.publish("covid19-detector", sensorValue);
}
