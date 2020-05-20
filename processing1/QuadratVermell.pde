class QuadratVermell extends Figura{
  float posx, posy;
  QuadratVermell(int posx,int posy){
    super(posx,posy);
    this.posx = posx;
    this.posy = posy;
  }
  
  @ Override public void pintar(){
    fill(192, 57, 43);
    rect(posx,posy,25,25);   
    posy = posy +1;
  }
  
  @ Override public float getY(){
    return this.posy;
  }
  public  boolean isOver()
  {
    if (mouseX > this.posx
        && mouseX < this.posx+50
        && mouseY > this.posy
        && mouseY < this.posy+50)
      {
        return true;
      }
      else
      {
        return false;
      }
  }
}