
const int P_LED1 = 12;
const int P_LED2 = 11;
const int P_IN1 = 10;
const int P_IN2 = 9;

int led_state1, led_state2;
int countdown1, countdown2;

void setup() {
  // put your setup code here, to run once:
  pinMode(P_LED1, OUTPUT);
  pinMode(P_LED2, OUTPUT);
  pinMode(P_IN1, INPUT_PULLUP);
  pinMode(P_IN2, INPUT_PULLUP);

  countdown1 = 0;
  countdown2 = 0;
  led_state1 = HIGH;
  led_state2 = HIGH;
  digitalWrite(P_LED1, led_state1);
  digitalWrite(P_LED2, led_state2);
}

int invert(int state)
{
  if(state == LOW) {
    return HIGH;
  }
  else {
    // assert(state == HIGH);
    return LOW;
  }
}

void loop() {
  // put your main code here, to run repeatedly:

  int speed;
  int time;

  if(digitalRead(P_IN1) == LOW) {
    // active low device
    speed = 1;
  }
  else {
    speed = 2;
  }

  if(digitalRead(P_IN2) == LOW) {
    // active low device
    time = 125;
  }
  else {
    time = 500;
  }
  
  if(countdown1 == 0) {
    led_state1 = invert(led_state1);
    countdown1 = speed; // 500 / 1000 ms between alternating
    digitalWrite(P_LED1, led_state1);
  }
  if(countdown2 == 0) {
    led_state2 = invert(led_state2);
    countdown2 = 4; // 2000 ms between alternating
    digitalWrite(P_LED2, led_state2);
  }
  
  countdown1--;
  countdown2--;
  delay(time);

}
