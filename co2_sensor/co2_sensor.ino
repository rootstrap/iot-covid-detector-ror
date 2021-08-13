String deviceId;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  getDeviceId();
}

void loop() {
  // put your main code here, to run repeatedly:
  readAnalogPort();
  delay(1000);
}

void getDeviceId() {
  deviceId = String(ESP.getChipId(), HEX);
}

void readAnalogPort() {
  int sensorValue = analogRead(0);
  String output = deviceId + " " + sensorValue;
  Serial.println(output);
}
