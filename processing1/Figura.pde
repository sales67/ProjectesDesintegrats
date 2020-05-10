class Figura {
  int posx, posy;
  Figura(int posx,int posy){
    this.posx = posx;
    this.posy = posy;
  }
  
  public void pintar(){
    ellipse(posx, posy, 25,25);
    posy = posy +1;
  }
  
  public int getY(){
    return this.posy;
  }
}
