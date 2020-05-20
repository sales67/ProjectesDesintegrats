class QuadratBlau extends Figura{
  float posx, posy;
  QuadratBlau(int posx,int posy){
    super(posx,posy);
    this.posx = posx;
    this.posy = posy;
  }
  
  @ Override public void pintar(){
    fill(41, 128, 185);
    rect(posx,posy,25,25);    
    posy = posy +1;
  }
  
  @ Override public float getY(){
    return this.posy;
  }
  public  boolean isOver()
  {  
    if (mouseX > this.posx
        && mouseX < this.posx+25
        && mouseY > this.posy
        && mouseY < this.posy+25)
      {
        return true;
      }
      else
      {
        return false;
      }
  }
}
