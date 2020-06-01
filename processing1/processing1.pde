//Musica
import ddf.minim.*;
Minim  minim;
AudioPlayer file;
AudioPlayer file2;

//Millis
int startMillis;
int duration = 100000;

//Ellipse animation
int x = 554;
int y = 520;

//Score i Fails
int score = 0;
int fails = 0;

//variables Tipografia
PFont fontBold;
PFont fontRegular;

//Variables Imgs
PImage logo;
PImage exitGame;
PImage help;
PImage checkInfo;
PImage musicName;
PImage youWin;
PImage youLose;

//Strings Info
String info = "Falling In Words is a game inspired by the classic game called Guitar Hero, but with the difference that this game is focused on children, and it's designed to be played on a Reactable.";
String info2 = "This game it's not only for having a good time, it's also to improve their reflexes and concentration";
String info3 = "Falling in words is developed by EDUARD CASALS, MAGALÍ CRESPO and SERGI SALÉS; students from the University of Vic";

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
String level = "facil";
int screen = 0;

// Declare music arrrays
// Babyshark song
int[][] babyshark = {
{12900,17000,20000,23000,27200,39600,40100,47600,60000,69000,81000,84000,90000,91000},
{25100,32100,35000,36600,44600,48300,57000,62000,70000,80000,82000,89000,92000,92000},
{22100,30600,33100,41100,46800,50200,55800,63000,72000,77000,83000,88000,93000},
{26100,28100,28900,38100,42100,53100,58000,67000,74000,75000,76000,85000},
};
int[][] spaceunicorn = {
{12900,20000,23000,27200,47600,60000,81000,84000,90000},
{32100,35000,36600,48300,57000,70000,89000,92000,92000},
{22100,41100,46800,50200,63000,72000,77000,83000,93000},
{26100,28900,38100,53100,58000,67000,74000,76000,85000},
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
  
     
  //music
  minim = new Minim (this);
  file2 =  minim.loadFile("/music/baby-shark.mp3");
  file =  minim.loadFile("/music/space-unicorn.mp3");
  
  //img
  logo = loadImage("/img/logo.png");
  exitGame = loadImage("/img/exit.png");
  help = loadImage("/img/info.png");
  musicName = loadImage("/img/music.png");
  youWin = loadImage("/img/win.png");
  youLose = loadImage("/img/lose.png");
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
   screen4();
  }
  
  //YOU LOSE
  if (screen == 5){
    screen5();
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
  if (screen == 4){
    screen = 1; 
  }
 }
}

void keyPressed() {
   // exit();
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
    //textFont(fontRegular);
    textSize(24);
    text("TOUCH THE SCREEN TO START THE GAME!", 512, 768);
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
    //text("OPTIONS", 510, 800);
    
    textFont(fontBold);
    textSize(18);
    text("EXIT", 580, 990);
    text("INFO", 444, 990);
    image(help, 444,920,80,80);
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
    
    fill(255,0,0);
    textSize(40);
    text("FAILS", 660, 300);
    text(fails, 660, 350);
    fill(255);
    text("SCORE", 364, 300);
    text(score, 364, 350);
    fill(35,0,62);
    line(512,200,512,410);
    //rect
    fill(35,0,62);
    
    //********** PANTALLA REACTABLE **********
    rect(235, 680,550,200);
    fill(255);
    line(440,512,440,1024);
    line(298,512,298,1024);
    
    line(584,512,584,1024);
    line(726,512,726,1024);
   
    //play music
    if (this.level == "facil"){
      file.play();
    }else{
      file2.play();
    }

    if (gameTime > 98000){
      screen = 4;
    }
    
    crearFigures();
    pintarFigures();
    borrarFigures();
    
}

void crearFigures(){
  int[][] musica;
  if (this.level == "facil"){
    musica = this.spaceunicorn;
  }else{
    musica = this.babyshark;
  }
  for (int i = 0 ; i <= 3 ; i++){
      for (int j = 0 ; j < musica[i].length-1 ; j++){
        if (gameTime < musica[i][j] + 9 && gameTime > musica[i][j] - 9){
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
//INFO
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
    textSize(30);
    text(info, 50, 580, width-100, height-12);
    text(info2,50,710, width-100, height-12);
    text(info3, 50, 800, width-100, height-12);
    
    image (checkInfo, 512,950,80,80);
}

//WIN SCREEN
void screen4(){
    textAlign(CENTER);
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    fill(102,46,155);
    rect(210,200,600,210);
    fill(0, 220, 61);
    text("YOU WIN", 512,330);    
    imageMode(CENTER);
    image(youWin, 300, 310, 100, 100);
    image(youWin, 730, 310, 100, 100);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontBold);
    textSize(50);
    fill(255);
    text("YOUR FINAL SCORE IS: "+score, 512,756);
    //fill(255);
    textSize(24);
    text("TOUCH THE SCREEN TO RETURN TO THE MENU", 512,856);     
}

void screen5(){
  textAlign(CENTER);
    //********** PANTALLA PROJECTOR **********
    textFont(fontBold);
    textSize(70);
    textAlign(CENTER);
    fill(102,46,155);
    rect(210,200,600,210);
    fill(255,46,0);
    text("YOU LOSE", 512,330);    
    imageMode(CENTER);
    image(youLose, 300, 310, 80, 80);
    image(youLose, 750, 310, 80, 80);
    
    //********** PANTALLA REACTABLE **********
    textFont(fontBold);
    textSize(50);
    fill(255, 46,0);
    text("OOPS, YOU HAVE SCORED 10 FAILS", 512, 650);
    fill(255);
    text("YOUR FINAL SCORE IS: "+score, 512,756);
    //fill(255);
    textSize(24);
    text("TOUCH THE SCREEN TO RETURN TO THE MENU", 512,856);  
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
  figures.add(new QuadratVermell(pos,512));q
}
int calcularPosicio(){
  int r = int(random(0,3));
   if (r == 0){
     return 273;
  }else if (r == 1){
     return 415; 
  }else if(r == 2){
     return 559;
  }else{
     return 701;
  }
}
