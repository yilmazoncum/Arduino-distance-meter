#include <SoftwareSerial.h>
SoftwareSerial BTSerial(10, 11);

#define trigPin 7
#define echoPin 2


int maximumRange = 55;
int minimumRange = 0;

void setup() {
 Serial.begin (9600);
 
 pinMode(trigPin, OUTPUT );
 pinMode(echoPin, INPUT );
}

void loop() {
  
  int data = FindDistance(maximumRange,minimumRange); 
  Serial.println(data); 
}

int FindDistance(int max,int min){

   long duration , distance;

   digitalWrite(trigPin, LOW);
   delayMicroseconds(2);
   digitalWrite(trigPin, HIGH);
   delayMicroseconds(10);
   digitalWrite(trigPin, LOW);

   duration = pulseIn(echoPin, HIGH);
   distance = duration / 58.2;
   delay(150);
 
   
   if(distance >= max || distance <= min)
   return 0;

   return distance;
}
