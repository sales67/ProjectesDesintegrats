class QuadratVerd extends Figura{
  float posx, posy;
  QuadratVerd(int posx,int posy){
    super(posx,posy);
    this.posx = posx;
    this.posy = posy;
  }
  
  @ Override public void pintar(){
    fill(46, 204, 113);
    rect(posx,posy,50,50);     
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
  
  public  boolean isOverTuioG(float xg, float yg, int idg)
  {
    if (xg > this.posx
        && xg < this.posx+50
        && yg > this.posy
        && yg < this.posy+50 && idg == 7)
      {
        return true;
      }
      else
      {
        return false;
      }
  }
  
  public String getColour(){
     return "green"; 
  }
}
