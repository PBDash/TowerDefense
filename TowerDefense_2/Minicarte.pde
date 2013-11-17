class Minicarte
{
  
  public ArrayList<PointColore> points;
  public int largeurCarte, hauteurCarte;
  public Point coord;
  public Point camera;
  
  public Minicarte()
  {
    
    points = new ArrayList<PointColore>();
    coord = new Point();
    camera = new Point(0, 0);
    coord.w = 100;
    coord.h = 75;
    
    setDimensions(600, 600);
    coord.x = 25;
    coord. y = 25;
    
    camera.x = 0;
    camera.y = 0;
    
  }
  
  public Minicarte(int a_l, int a_h)
  {
    
    this();
    
    setDimensions(a_l, a_h);
    
  }
  
  public void setDimensions(int a_l, int a_h)
  {
    
    largeurCarte = a_l > 0 ? a_l : 800;
    hauteurCarte = a_h > 0 ? a_h : 600;
    
  }
  
  public void setCamera(Point a_camera)
  {
    
    camera.x = a_camera.x * coord.w / largeurCarte;
    camera.y = a_camera.y * coord.h / hauteurCarte;
    camera.w = coord.w  * 600 / largeurCarte;
    camera.h = coord.h  * 600  / hauteurCarte;
    
  }
  
  public void ajouterPoint(int a_x, int a_y, int a_r, int a_g, int a_b)
  {
    
    points.add(new PointColore(a_x * 100 / largeurCarte, a_y * 75 / hauteurCarte, a_r, a_g, a_b));
    
  }
  
  public void ajouterPoint(int a_x, int a_y, String type)
  {
    
    if(type.equals("TOUR")){
     
      ajouterPoint(a_x, a_y, 125, 255, 125);
      
    }
    
    if(type.equals("MUR")){
     
      ajouterPoint(a_x, a_y, 125, 125, 255);
      
    }
    
  }
  
  public void clear()
  {
    
    points.clear();
    
  }
  
  public Point positionnerCamera(int mouseX, int mouseY)
  {
    

    if(mouseX > coord.x && mouseX < coord.x + coord.w && mouseY > coord.y && mouseY < coord.y + coord.h){
      
      Point retour = new Point(0, 0);
      retour.x = (mouseX - coord.w/2) * largeurCarte / coord.w;
      retour.y = (mouseY - coord.h/2) * hauteurCarte / coord.h;
      
      if(retour.x + camera.w > largeurCarte) return null;
      if(retour.y + camera.h > hauteurCarte) return null;
      

      return retour;
     
    }
    
    return null;
    
  }
  
  public void afficher()
  {
    
    fill(255, 255, 255, 100);
    rectMode(CORNER);
    stroke(255);
    rect(coord.x, coord.y, coord.w, coord.h);
    stroke(125);
    fill(125, 125, 125, 125);
    rect(coord.x + camera.x, coord.y + camera.y, camera.w, camera.h);
    
    for(int i = 0; i < points.size(); i++){
     
      if(blue(points.get(i).couleur) == 255 && green(points.get(i).couleur) == 125){
        PointColore pc = points.get(i);
        fill(pc.couleur);
        stroke(pc.couleur);
        rectMode(CENTER);
        rect(coord.x + pc.x, coord.y + pc.y, 2, 2);
      }
    }
    
    for(int i = 0; i < points.size(); i++){
     
      if(green(points.get(i).couleur) == 255 && blue(points.get(i).couleur) == 125){
        PointColore pc = points.get(i);
        fill(pc.couleur);
        stroke(pc.couleur);
        rectMode(CENTER);
        rect(coord.x + pc.x, coord.y + pc.y, 2, 2);
      }
    }
    
  }
  
}
