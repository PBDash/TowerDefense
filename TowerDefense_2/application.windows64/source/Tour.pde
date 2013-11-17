class Tour extends Objet
{
  
  int portee;
  
  public Tour()
  {
    
    super();
    portee = 0;
    
  }
  
  public Tour(int a_x, int a_y)
  {
    
    super(a_x, a_y);
    portee = 0;
    
  }
  
  public Tour(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    super(a_x, a_y, a_image, a_w, a_h);
    portee = 0;
    
  }
  
  public void setPortee(int a_portee)
  {
    
    portee = a_portee > 0 ? a_portee : portee;
    
  }
  
}
