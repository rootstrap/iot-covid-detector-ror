#include <ESP8266WiFi.h>
#include <PubSubClient.h>

WiFiClient espClient;
PubSubClient client(espClient);

const char *ssid = "...";
const char *password = "...";
const char *mqtt_server = "test.mosquitto.org";
const char *mqtt_topic = "rs/covid-detector/measure";

String deviceId;
long lastMsg = 0;
int sensorValue;
char message[1000];
char deviceIdCharArray[100];
char measureCharArray[100];

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
  delay(500);
  WiFi.begin(ssid, password);
  Serial.println("Connecting to wifi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(500);
  }

  Serial.println("Connected!");
}

void reconnect()
{
  String clientId = "ESP8266Client-";
  Serial.println("Connecting to mqtt_server");
  while (!client.connected())
  {
    clientId += String(random(0xffff), HEX);
    client.connect(clientId.c_str());
    Serial.print(".");
    delay(500);
  }
  Serial.println("Connected!");
}

void loop()
{
  if (!client.connected())
  {
    reconnect();
  }
  client.loop();

  delay(5000);

  sensorValue = analogRead(0);
  deviceId.toCharArray(deviceIdCharArray, 100);
  itoa(sensorValue, measureCharArray, 10);

  strcpy(message, "{ device_id: ");
  strcat(message, deviceIdCharArray);
  strcat(message, ", mesure: ");
  strcat(message, measureCharArray);
  strcat(message, " }");

  client.publish(mqtt_topic, message);
  Serial.println(message);
}
