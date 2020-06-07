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
  public  boolean isOverTuioY(float xy, float yy, int idy)
  {
   return true;
  }
  public  boolean isOverTuioR(float xr, float yr, int idr)
  {
   return true;
  }
  public  boolean isOverTuioB(float xb, float yb, int idb)
  {
   return true;
  }
  public  boolean isOverTuioG(float xg, float yg, int idg)
  {
   return true;
  }
  public String getColour(){
     return "-"; 
  }  
}
