PFont fontBold;
PFont fontRegular;
PImage logo;
float mx = 0;
float my = 505;
float mw = 1024;
float mh = 500;

float px = 0;
float py = 0;
float pw = 0;
float ph = 0;

float ox = 435;
float oy = 750;
float ow = 150;
float oh = 80;

int screen = 0;

void setup(){
  size(1024,1000);
  //Tipografia
  fontBold = loadFont("BalooDa2-Bold.vlw");
  fontRegular = loadFont("BalooDa2-Regular.vlw");
  //img
  logo = loadImage("/img/letter.png");
}//setup

void draw(){
  background(35,0,62);
  //Lina separadora pantalles
  line(0,500,1024,500);
  stroke(255);
  strokeWeight(5);
  
  //PANTALLA INICIAL
  if (screen == 0){
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    text("FALLING IN WORDS", 512,250);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    
    textFont(fontRegular);
    textSize(24);
    text("Touch the screen to start the game!", 512, 750);
    fill(0,0,0,0);
    stroke(0,0,0,0);
    rect(mx,my,mw,mh);
    stroke(255);
    fill(255);
  }
  
  //INICI
  if (screen == 1){
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    text("FALLING IN WORDS", 512,250);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontRegular);
    fill(0,0,0,0);
    rect(px,py,pw,ph);
    rect(ox,oy,ow,oh);
    textSize(32);
    fill(255);
    text("Jugar", 510, 670);
    text("Options", 510, 800);
    
  }
  
  if (screen == 2){
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    text("JOC", 512,250);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontRegular);
    textSize(24);
    text("JOC", 512, 750);
  }
  
 if (screen == 3){
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    text("OPTIONS", 512,250);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontRegular);
    textSize(24);
    text("OPTIONS", 512, 750);
  }
}

void mousePressed() {
  //Set the screen when whatever happens that you want to happen
  if(mousePressed){
      if(mouseX>mx && mouseX <mx+mw && mouseY>my && mouseY <my+mh){
       screen = 1;
       mx = 0;
       my = 0;
       mw = 0;
       mh = 0;
       px = 435;
       py = 620;
       pw = 150;
       ph = 80;
       ox = 435;
       oy = 750;
       ow = 150;
       oh = 80;
       print(screen);
  }  
      if(mouseX>px && mouseX <px+pw && mouseY>py && mouseY <py+ph){
       screen = 2;
       ox = 0;
       oy = 0;
       ow = 0;
       oh = 0;
  }
      if(mouseX>ox && mouseX <ox+ow && mouseY>oy && mouseY <oy+oh){
       screen = 3;
       px = 0;
       py = 0;
       pw = 0;
       ph = 0;
  }
 }
}

void keyPressed() {
  if (screen == 2) {
    screen = 1;
     px = 435;
       py = 620;
       pw = 150;
       ph = 80;
       ox = 435;
       oy = 750;
       ow = 150;
       oh = 80;
  } else if (screen == 3){
    screen = 1;
     px = 435;
       py = 620;
       pw = 150;
       ph = 80;
       ox = 435;
       oy = 750;
       ow = 150;
       oh = 80;
  }
}
