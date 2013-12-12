

void setup() {
  
  Serial.begin(9600);
}

void loop() {
  int v = digitalRead(2);
  
  Serial.write(v);
}
