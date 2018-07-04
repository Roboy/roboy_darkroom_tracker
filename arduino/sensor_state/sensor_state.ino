void setup() {
  Serial.begin(115200);
  Serial.println("");
  Serial.println("------------------------------------------------------");
  Serial.println("                    DARKROOM ESP");
  Serial.println("------------------------------------------------------");
  pinMode(D5, INPUT);
  pinMode(D6, INPUT);
  pinMode(D7, INPUT);
  pinMode(D8, INPUT);
}

void loop() {
  uint8_t val[3];
  val[0] = digitalRead(D5);
  val[1] = digitalRead(D6);
  val[2] = digitalRead(D7);
  uint8_t state = ((val[2]>>6)&0x1|(val[1]>>7)&0x1|(val[0])&0x1);
  switch(state){
    case 0: Serial.println("sleep"); break;
    case 1: Serial.println("watch"); break;
    case 2: Serial.println("s3"); break;
    case 3: Serial.println("s0"); break;
    default: Serial.println("unknown"); break;
  }
}
