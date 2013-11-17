class PointColore extends Point
{
  
  public color couleur;
  
  public PointColore()
  {
    
    super();
    couleur = color(0, 0, 0);
    
  }
  
  public PointColore(int a_r, int a_g, int a_b)
  {
    
    setCouleur(a_r, a_g, a_b);
    
  }
  
  public PointColore(int a_x, int a_y)
  {
    
    setPos(a_x, a_y, 0, 0);
    
  }
  
  public PointColore(int a_x, int a_y, int a_r, int a_g, int a_b)
  {
    
   setPos(a_x, a_y, 0, 0);
    
   setCouleur(a_r, a_g, a_b);
    
  }
  
  public PointColore(int a_x, int a_y, int a_w, int a_h, int a_r, int a_g, int a_b)
  {
    
    setPos(a_x, a_y, a_w, a_h);
    setCouleur(a_r, a_g, a_b);
    
  }
  
  public void setPos(int a_x, int a_y, int a_w, int a_h)
  {
    
    x = a_x;
    y = a_y;    
    w = a_w;
    h = a_h;
    
  }
  
  
  public void setCouleur(int a_r, int a_g, int a_b)
  {
    
    int r = a_r > 0 ? a_r : 0;
    int g = a_g > 0 ? a_g : 0;
    int b = a_b > 0 ? a_b : 0;
    
    couleur = color(r, g, b);
    
  }
  
}
