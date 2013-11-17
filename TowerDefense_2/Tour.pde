class Tour extends Objet
{
  
  public int portee;
  public int pv;
  public String type;
  
  public Tour()
  {
    
    super();
    type = "Tour de base";
    pv = 100;
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
  
  public Tour(String a_type, int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    super(a_x, a_y, a_image, a_w, a_h);
    type = new String(a_type);
    portee = 0;
    
  }
  
  public void setPortee(int a_portee)
  {
    
    portee = a_portee > 0 ? a_portee : portee;
    
  }
  
  public void setPV(int a_pv)
  {
    
    pv = a_pv > 0 ? a_pv : pv;
    
  }
  
}
