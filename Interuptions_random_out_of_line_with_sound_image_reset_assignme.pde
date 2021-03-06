// VERSION 1.0.12

import processing.sound.*;
SoundFile file;
PImage blurSphere;
PImage greySphere;

int spacingY = 20;
int spacingX = 100;

int varAngle = 10;

int lineLength = 15;
int lineMove = 500;

float sWeight = 16;

int r;
int g;
int b;
int d = 0;
int black = 1;

int drawCount = 50;
// adjust draw speed


boolean colourChange = true;
boolean brush;
boolean brushDrag;
boolean loop;
boolean blackFrame = false;

float brushSize = 500;
float brushPosX;
float brushPosY;

boolean assignment = true;

color backGround = color(#000000);


void setup() {

  size(2560,1440);
  
  file = new SoundFile(this, "sound.mp3");
  file.loop();
  blurSphere = loadImage("Black-Shape-Int.png");
  greySphere = loadImage("Grey-Shape-Int.png");
  smooth();
  if (assignment == true){

    backGround = color(232,232,232);
    spacingY = 50;
    spacingX = 40;
    varAngle = 10;
    lineLength = 30;
    lineMove = 100;
    sWeight = 2.5;
    colourChange = false;
    brush = false;
    
  }
  background(backGround); 
}

void draw() {

  if (d == drawCount){
        
    if (black == 1 && blackFrame == true){
        
      stroke(0);
      black = 0;
      
    } else if (assignment == true) {
    
      stroke(#000000);
      
    } else {
    
      stroke(r,g,b);
      black ++;      
    
    }
    
    int x = 100;  
    
    while (x < width - 100){
      
      int y = 100;
      
      while (y < height - 100) {
        
        blendMode(REPLACE);
        float randAngle = random(-varAngle,varAngle);
        int posMov = (int)random(lineMove);
        strokeWeight(sWeight);
        line(x + posMov, y , x  + posMov + lineLength * sin(randAngle), y + lineLength * cos(randAngle));
        y += spacingY;   
      
      }
    
    x += spacingX;
    
    }
    
    d = 0;
    
  }
  
  d ++;
  
  if (colourChange == true){
    
    r = (int)random(0,255);
    g = (int)random(0,255);
    b = (int)random(0,255);
    
  }
  
  if (brush == true){

    noStroke();
    blendMode(DARKEST);
    imageMode(CENTER);
    noTint();
    image(blurSphere, brushPosX, brushPosY, brushSize, brushSize);

  } 
  
}

void keyPressed(){
  
  /* if (keyCode == UP && drawCount > 4){
    
    drawCount -= 2;
    print("// Increased speed ", drawCount);
    
  } else if (keyCode == DOWN) {
  
    drawCount += 2;
    print("// Decreased speed ", drawCount);
    
  } else if (keyCode == 32){
    
    print("// Spacebar pressed & ");
    
    if (loop == true){
      
      noLoop();    
      loop = false;
      print("stopped //");
      
    } else if (loop == false){
    
      loop();
      loop = true;
      print("started ");
      
    }
    
  } else if (keyCode == 67){
    
    print("//C Pressed & ");
  
   if (colourChange == true){
       
    colourChange = false;
    print("colour off ");
    
   } else if (colourChange == false){
  
    colourChange = true;
    print("colour on ");
    
   } */
  
  if(keyCode == 10) {
    
    noStroke();
    fill(backGround);
    rect(0, 0, width, height);
  
  }

} 

/* void mouseWheel(MouseEvent event) {
  
  brushSize = map(event.getCount(),0 ,8 , 0, 500);
  print("// Brush size changed", brushSize);
  
}

void mouseClicked(){
  
  brush = true;
  brushPosX = mouseX;
  brushPosY = mouseY;
  print("// Mouse clicked ");

} */

void mouseMoved(){
 if (assignment == true){
     
   noStroke();
   blendMode(REPLACE);
   imageMode(CENTER); 
   image(greySphere, mouseX, mouseY, 100, 100);
  
 }
 
}