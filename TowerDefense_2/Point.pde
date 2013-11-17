/**CONSTITUEE D'UNE ABSISSE/ORDONEE/LARGEUR/HAUTEUR*/

class Point
{
  
  public int x, y, w, h;
  
  public Point()
  {
    
    x = 0;
    y = 0;
    x = 0;
    h = 0;
    
  }
  
  public Point(int a_x, int a_y)
  {
    
    setPos(a_x, a_y, 0, 0);
    
  }
  
  public Point(int a_x, int a_y, int a_w, int a_h)
  {
    
    setPos(a_x, a_y, a_w, a_h);
    
  }
  
  public void setPos(int a_x, int a_y, int a_w, int a_h)
  {
    
    x = a_x;
    y = a_y;    
    w = a_w;
    h = a_h;
    
  }
  
}
