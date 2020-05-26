//Musica
import ddf.minim.*;
Minim  minim;
AudioPlayer file;

//Millis
int startMillis;
int duration = 100000;

//Ellipse animation
int x = 554;
int y = 520;

//Score i Fails
int score = 0;
int fails = 0;

//Slider llum pantalla
import controlP5.*;
ControlP5 cp5;
int myColor = color(35,0,62);
int sliderTicks2 = 30;

//variables Tipografia
PFont fontBold;
PFont fontRegular;

//Variables Imgs
PImage logo;
PImage exitGame;
PImage options;
PImage musicOptions;
PImage lightOptions;
PImage checkOptions;
PImage cancelOptions;
PImage musicName;
PImage youWin;
PImage youLose;

//Sliders
int positionMusic1;
int positionLight1;

//Buttons
//boolean exitGame = false;

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

boolean started = false;

int gameTime = 0;

int screen = 0;

// Declare music arrrays
// Babyshark song
int[][] babyshark = {
{12900,15000,17000,18000,24200,33600,34100,34600},
{21100,22600,29500,31600,32600,38300},
{19100,19600,25900,30100,30800,35200,36800},
{20100,23100,24900,31100,32100,33100},
};

// declarar l'array de les figures que estan actives.
ArrayList<Figura> figures = new ArrayList();

int[][] myArray = {  {0, 1, 2, 3},
                     {3, 2, 1, 0},
                     {3, 5, 6, 1},
                     {3, 8, 3, 4}  };

void setup(){
  size(1024,1024);
  //Tipografia
  fontBold = loadFont("BalooDa2-Bold.vlw");
  fontRegular = loadFont("BalooDa2-Regular.vlw");
  
  //Slider llum
  /*cp5 = new ControlP5(this);
  cp5.addSlider("sliderTicks2")
     .setPosition(100,370)
     .setWidth(400)
     .setRange(255,0) // values can range from big to small as well
     .setValue(128)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE);*/
     
  //music
  minim = new Minim (this);
  file =  minim.loadFile("/music/baby-shark.mp3");
  
  //img
  logo = loadImage("/img/logo.png");
  exitGame = loadImage("/img/exit.png");
  options = loadImage("/img/options.png");
  musicOptions = loadImage("/img/music.png");
  lightOptions = loadImage("/img/light.png");
  checkOptions = loadImage("/img/check.png");
  cancelOptions = loadImage("/img/close.png");
  musicName = loadImage("/img/music.png");
  youWin = loadImage("/img/win.png");
  youLose = loadImage("/img/lose.png");
  
  //sliders
  positionMusic1 = 0;
  positionLight1 = 0;
  
}//setup

void draw(){
  background(35,0,62);
  //Lina separadora pantalles
  line(0,512,1024,512);
  stroke(255);
  strokeWeight(5);
  
  //PANTALLA INICIAL
  if (screen == 0){
    screen0();
  }
  
  //INICI
  if (screen == 1){
    screen1();  
  }
  //GAME
  if (screen == 2){
    screen2();
  }
 
   //OPTIONS
   if (screen == 3){
   screen3();
  }
 

  //YOU WIN
  if (screen == 4){
   
  }
  
  //YOU LOSE
  if (screen == 5){
   textAlign(CENTER);
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    text("YOU LOSE", 512,256);
    imageMode(CENTER);
    image (youLose, 512,350,60,60);
    
    //********** PANTALLA REACTABLE **********   
  }
 }

void mousePressed() {
  //Set the screen when whatever happens that you want to happen
  if(mousePressed){
    print(screen);
      if(mouseX>mx && mouseX <mx+mw && mouseY>my && mouseY <my+mh && screen == 0){
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
  }  
      if(mouseX>px && mouseX <px+pw && mouseY>py && mouseY <py+ph && screen == 1){
       screen = 2;
       ox = 0;
       oy = 0;
       ow = 0;
       oh = 0;
  }
      if(mouseX>ox && mouseX <ox+ow && mouseY>oy && mouseY <oy+oh && screen == 2){
       screen = 3;
       px = 0;
       py = 0;
       pw = 0;
       ph = 0;
  }
 }
}

void keyPressed() {
  //exitGame
  if (screen == 1){
   // exit();
  }
  
  //return Start
  if(screen == 5){
   // screen = 1;
  }
  
  if (screen == 2) {   
    if (mouseButton == LEFT){
      for (Figura figura : new ArrayList<Figura>(figures)){
        if (figura.isOver()){
          if(figura.getColour() == "blue" && keyCode == 81){
            figures.remove(figura);
            score++;          
          }if(figura.getColour() == "yellow" && keyCode == 87){
            figures.remove(figura);
            score++;          
          }if(figura.getColour() == "green" && keyCode == 69){
            figures.remove(figura);
            score++;          
          }if(figura.getColour() == "red" && keyCode == 82){
            figures.remove(figura);
            score++;          
          }
         }
      }      
    } 
   // screen = 1;
     /*  px = 435;
       py = 620;
       pw = 150;
       ph = 80;
       ox = 435;
       oy = 750;
       ow = 150;
       oh = 80;*/
  } else if (screen == 3){
    /*
    screen = 1;
       px = 435;
       py = 620;
       pw = 150;
       ph = 80;
       ox = 435;
       oy = 750;
       ow = 150;
       oh = 80;*/
  }
}

void screen0(){
   //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    text("FALLING IN WORDS", 512,256);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontRegular);
    textSize(24);
    text("Touch the screen to start the game!", 512, 768);
    fill(0,0,0,0);
    stroke(0,0,0,0);
    rect(mx,my,mw,mh);
    stroke(255);
    fill(255);
}

//INICI
void screen1(){
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    text("FALLING IN WORDS", 512,256);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontRegular);
    fill(0,0,0,0);
    rect(px,py,pw,ph);
    rect(ox,oy,ow,oh);
    textSize(32);
    fill(255);
    text("START", 510, 670);
    text("OPTIONS", 510, 800);
    
    textFont(fontBold);
    textSize(18);
    text("EXIT", 580, 990);
    text("OPTIONS", 444, 990);
    image(options, 444,920,80,80);
    image(exitGame, 580,920, 80,80);
}

//GAME
void screen2(){
    gameTime = millis();
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(45);
    textAlign(CENTER);
    fill(255);
    text("Baby Shark - PinkFong!", 512,130);
    
    imageMode(CENTER);
    image(musicName, 230,115, 60,60);
    image(musicName, 794,115, 60,60);
    
    fill(102,46,155);
    rect(210,200,600,210);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontBold);
    fill(255,0,0);
    textSize(24);
    text("FAILS", 180, 750);
    text(fails, 180, 790);
    fill(255);
    text("SCORE", 844, 750);
    text(score, 844, 790);
    //rect
    fill(35,0,62);
    line(512,0,512,1024);
    rect(230,680,550,200);

    
    fill(255);
    line(470,512,470,1024);
    line(388,512,388,1024);
    
    line(554,512,554,1024);
    line(636,512,636,1024);
   
    //play music
    //file.play();
    
    /*if(mousePressed){
      startMillis = millis();
    }
    
    if(millis() < startMillis + duration){
      ellipse(554,y,30,30);
      y = y + 1;
    }*/
    
    crearFigures();
    pintarFigures();
    borrarFigures();
    
}

void crearFigures(){
  for (int i = 0 ; i <= 3 ; i++){
      for (int j = 0 ; j < babyshark[i].length-1 ; j++){
        if (gameTime < babyshark[i][j] + 10 && gameTime > babyshark[i][j] - 10){
          //pintar peça amb numero babyshark[i];
          if (i==0){
            crearQuadratBlau();
          }else if (i==1){
            crearQuadratVerd();
          }
          else if (i==2){
            crearQuadratGroc();
          }
          else if (i==3){
            crearQuadratVermell();
          }
          break;
        }
      }
    }
}

void pintarFigures(){
  strokeWeight(0);
  for (Figura figura : figures) { 
    figura.pintar();
  }
  strokeWeight(5);
}

void borrarFigures(){
  //ArrayList<Figura> figures2 = new ArrayList();
  ArrayList<Figura> figures2 = new ArrayList<Figura>(figures.size());
    for (Figura figura : figures) {
        figures2.add(figura);
    }
  for (Figura figura : figures2){
    if (figura.getY() > 950){
      figures.remove(figura);
      fails++;
    } 
  } 
}

void mouseClicked(){
  
}
void screen3(){
    textAlign(CENTER);
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    text("FALLING IN WORDS", 512,256);
    imageMode(CENTER);
    image (logo, 512,350);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontBold);
    textSize(60);
    text("OPTIONS", 512, 630);
    textSize(24);
    //text("Options of the game", 512, 768);
    image(musicOptions, 400,720,50,50);
    image(lightOptions, 400, 820, 50,50);
    image (checkOptions, 512,950,80,80);
}

//WIN SCREEN
void screen4(){
    textAlign(CENTER);
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    text("YOU WIN", 512,256);
    imageMode(CENTER);
    image (youWin, 512,350,60,60);
    //********** PANTALLA REACTABLE **********     
}

void crearQuadratBlau(){  
  int pos = calcularPosicio();
  figures.add(new QuadratBlau(pos,512));
}
void crearQuadratVerd(){
  int pos = calcularPosicio();
  figures.add(new QuadratVerd(pos,512));
}
void crearQuadratGroc(){
  int pos = calcularPosicio();
  figures.add(new QuadratGroc(pos,512));
}
void crearQuadratVermell(){
  int pos = calcularPosicio();
  figures.add(new QuadratVermell(pos,512));
}
int calcularPosicio(){
  int r = int(random(0,3));
   if (r == 0){
     return 383;
  }else if (r == 1){
     return 458; 
  }else if(r == 2){
     return 554;
  }else{
     return 622;
  }
}
