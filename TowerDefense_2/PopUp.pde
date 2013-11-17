class PopUp
{
  
  public Point position;
  PImage img;
  public HashMap<String, Bouton> boutons;
  
  public PopUp()
  {
    
    img = loadImage("data/img/ui/popup.png");
    boutons = new HashMap<String, Bouton>();
    position = new Point();
    setPos(0, 0, 0, 0);
    
  }
  
  public PopUp(int a_x, int a_y)
  {
   
    this();
    setPos(a_x, a_y);
    
  }
  
  public PopUp(int a_x, int a_y, int a_w, int a_h)
  {
    
    this();
    setPos(a_x, a_y, a_w, a_h);
    
  }
  
  public void setPos(int a_x, int a_y)
  {
    
    position.x = a_x;
    position.y = a_y;
    
  }
  
  public void setPos(int a_x, int a_y, int a_w, int a_h)
  {
    
    position.x = a_x;
    position.y = a_y;
    position.w = a_w;
    position.h = a_h;
    
  }
  
  public void afficher()
  {
    
    imageMode(CENTER);
    image(img, position.x, position.y, position.w, position.h);
    
    rectMode(CENTER);
    
    Set<String> set = boutons.keySet();
    
    for(String s : set){
       
      boutons.get(s).afficher(); 
     
    }
    
  }
  
  public boolean hover(int mouseX, int mouseY)
  {
    
    if(mouseX > position.x - position.w/2 && mouseX < position.x + position.w/2 && mouseY > position.y - position.h / 2&& mouseY < position.y + position.h/2){
      return true; 
    }
    
    return false;
    
  }
  
  public String trouverBoutonHover(int mouseX, int mouseY)
  {
    
    Set<String> set = boutons.keySet();
    
    for(String s : set){
      
      Point tmp = boutons.get(s).position;
      if(mouseX > tmp.x - tmp.w/2 && mouseX < tmp.x + tmp.w/2 && mouseY > tmp.y - tmp.h/2 && mouseY < tmp.y + tmp.h/2){
        return s; 
      }
      
    }
    
    return null;
    
  }
  
  public void ajouterBouton(String a_indice, int a_x, int a_y, int a_w, int a_h, String a_image, String a_texte)
  {
    
    boutons.put(a_indice, new Bouton(a_x + position.x, a_y + position.y, a_w, a_h, a_image, a_texte));
    
  }
  
  public void setBoutonPosImage(String a_indice, int a_x, int a_y, int a_w, int a_h)
  {
    
    if(!boutons.containsKey(a_indice))
      return;
    
    boutons.get(a_indice).setPosImage(a_x, a_y, a_w, a_h);
    
  }
  
  public void setBoutonPosTexte(String a_indice, int a_x, int a_y, int a_w, int a_h)
  {
    
    if(!boutons.containsKey(a_indice))
      return;    
 
    boutons.get(a_indice).setPosTexte(a_x, a_y, a_w, a_h);
    
  }
  
}
