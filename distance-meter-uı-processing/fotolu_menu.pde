import processing.serial.*;  
Serial myPort;
String data="";
String distance= "";

int screenNum,screenCounter=0;
PImage menuImg,oneImg,twoImg,threeImg;
String dis1,dis2,dis3,x;
int int1,int2,int3,converted;

void setup(){
  
myPort = new Serial(this, "COM4", 9600);
myPort.bufferUntil('\n');

screenNum = 0;
fullScreen();
menuImg = loadImage("menu.png");
oneImg = loadImage("one.png");
twoImg = loadImage("two.png");
threeImg = loadImage("three.png");
image(menuImg, 0, 0);
}


void draw(){
  
if(screenNum == 0 ){ // ana menü //case yapsak daha iyi

  if (keyPressed) {
    if (key == '1') {
      screenNum = 1;
    } 
    if (key == '2') {
      screenNum = 2;
    } 
    if (key == '3') {
      screenNum = 3;
     }  
}
}

if(screenNum == 1){  //1-dimension screen
  
  image(oneImg, 0, 0);
  
  if (keyPressed) {
      if (key == '1') {
        
        dis1 = getData();     
        
      } 
    }
    
    printDistance(dis1,400);
  int1 = int(dis1.trim());

  fill(112,128,144);
  rect(width/7,height/2,int1*20,10);
 

         
} 

if(screenNum == 2){ //2-dimension screen
  
  image(twoImg, 0, 0);
  
  switch(screenCounter){
    
    
  case 0:
  print("debug0");
   
    if (keyPressed) {
      if (key == '1') {
        
        dis1 = getData();
        print("debugKey");
        screenCounter++;
        
       
        
        
      } 
    }
    
    
  
  break;
    
    
  case 1:
  print("debug1");
  

    if (keyPressed) {
      if (key == '2') {
 
        dis2 = getData();
        print("debugKey");
        screenCounter++;
        
        
      } 
    }
   break;
   
   case 2:
   
   printDistance(dis1,400);
   printDistance(dis2,600);
   
   int1 = int(dis1.trim());
   int2 = int(dis2.trim());
   
   fill(112,128,144);
   rect(width/7,height/4,int1*25,int2*25);
   text("Area :" + (int1 * int2) + "cm^2",width/3.5,1000);
   break;

  }

}

if(screenNum == 3){ // 3-dimension screen

  image(threeImg, 0, 0);
  
  switch(screenCounter){
    
    
  case 0:
  print("debug0");
   
    if (keyPressed) {
      if (key == '1') {
        
        dis1 = getData();
        print("debugKey");
        screenCounter++;
        
        
      } 
    }
  
  break;
    
    
  case 1:
  print("debug1");
  

    if (keyPressed) {
      if (key == '2') {
 
        dis2 = getData();
        print("debugKey");
        screenCounter++;
        
        
      } 
    }
   
   break;
   
   case 2:
     
     print("debug2");
  

    if (keyPressed) {
      if (key == '3') {
 
        dis3 = getData();
        print("debugKey");
        screenCounter++;
        
        
      } 
    }
   
   break;
   
   case 3:
   printDistance(dis1,400);
   printDistance(dis2,600);
   printDistance(dis3,800);
   
   int1 = int(dis1.trim());
   int2 = int(dis2.trim());
   int3 = int(dis3.trim());
   
   fill(112,128,144);
   rect(width/7,height/4,int1*25,int2*6);
   rect(width/7,(height/4)+330,int1*25,int3*6);
   
   text("Volume :" + (int1*int2*int3) + "cm^3",width/3.5,1000);


   break;
  
  
  

  }
  
}

  
}


void printDistance(String dis,int x)
{
  textAlign(CENTER);
  fill(255);
  textSize(61);
  
  
  converted = int(dis.trim());
  
  text(dis,1470,x);
  text((converted*0.393701),1470,x+70);
  text("Distance :       cm",1350,x); 
  text("                                inch",1350,x+70); 
      
    
  }     
    
String getData(){
  
    distance = data;
    
     if(distance == "0")
  {
     getData();
  }
    
    return distance;
   } 
   
   
void isDataZero(String distance)
{
  if(distance == "0")
  {
     distance =data;
     isDataZero(distance);
  }
  
}

void serialEvent(Serial myPort){
 
  data=myPort.readStringUntil('\n');
}
