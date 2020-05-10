class Rodona extends Figura{
  int posx, posy;
  Rodona(int posx,int posy){
    super(posx,posy);
    this.posx = posx;
    this.posy = posy;
  }
  
  @ Override public void pintar(){
    ellipse(posx, posy, 25,25);
    posy = posy +1;
  }
  
  @ Override public int getY(){
    return this.posy;
  }
}
