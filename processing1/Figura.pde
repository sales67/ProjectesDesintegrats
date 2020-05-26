class Figura {
  float posx, posy;
  Figura(int posx,int posy){
    this.posx = posx;
    this.posy = posy;
  }
  
  public void pintar(){
    //ellipse(posx, posy, 25,25);
    //posy = posy +1;
  }
  
  public float getY(){
    return this.posy;
  }
  
  public  boolean isOver()
  {
   return true;
  }
  public String getColour(){
     return "-"; 
  }  
}
