/** CLASSE DE BASE, OU LES AUTRES VONT HEITER */

class Objet
{
  
  Point coord;
  PImage image;
  
  public Objet()
  {
    
    image = loadImage("img/defaut.png");
    coord = new Point(0, 0, 0, 0);
    
  }
  
  public Objet(int a_x, int a_y)
  {
    
    image = loadImage("img/defaut.png");
    coord = new Point(a_x, a_y, 60, 60);
    
  }
  
  public Objet(int a_x, int a_y, String a_image)
  {
    
    image = loadImage(a_image);
    coord = new Point(a_x, a_y, 60, 60);
    
  }
  
  public Objet(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    image = loadImage(a_image);
    coord = new Point(a_x, a_y, a_w, a_h);
    
  }
  
  public void afficher()
  {

    rectMode(CENTER);
    tint(255, 255, 255, 255);
    image(this.image, coord.x - coord.w/2, coord.y - coord.h/2, coord.w, coord.h);
    
  }
  
}
