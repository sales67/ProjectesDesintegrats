class QuadratVermell extends Figura{
  float posx, posy;
  QuadratVermell(int posx,int posy){
    super(posx,posy);
    this.posx = posx;
    this.posy = posy;
  }
  
  @ Override public void pintar(){
    fill(192, 57, 43);
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
  
  public  boolean isOverTuioR(float xr, float yr, int idr)
  {
    if (xr > this.posx
        && xr < this.posx+50
        && yr > this.posy
        && yr < this.posy+50 && idr == 5)
      {
        return true;
      }
      else
      {
        return false;
      }
  }
  
  public String getColour(){
     return "red"; 
  }
}
