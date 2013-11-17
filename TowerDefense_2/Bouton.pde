class Bouton
{
  
  public String valeurActu;
  
  public PImage img;
  public String texte;
  public Point position;
  public Point positionImage;
  public Point positionTexte;
  
  public Bouton()
  {
    
    valeurActu = "NULL";
    texte = ""; 
    position = new Point();
    positionImage = new Point();
    positionTexte = new Point();
  
  }  
  
  public Bouton(int a_x, int a_y, int a_w, int a_h)
  {
    
    this();
    setPosition(a_x, a_y, a_w, a_h);
    
  }
  
  public Bouton(int a_x, int a_y, int a_w, int a_h, String a_image, String a_texte)
  {
    
    this(a_x, a_y, a_w, a_h);
    chargerImage(a_image);
    texte = a_texte;
    
  }
  
  public void setPosition(int a_x, int a_y, int a_w, int a_h)
  {
    
    position.x = a_x;
    position.y = a_y;
    position.w = a_w;
    position.h = a_h;
    
  }
  
  public boolean hover(int mouseX, int mouseY)
  {
    
    if(mouseX > position.x - position.w/2 && mouseX < position.x + position.w/2 && mouseY > position.y - position.h/2 && mouseY < position.y + position.h/2){
      return true; 
    }
    
    return false;
    
  }
  
  public void chargerImage(String a_img)
  {
    
    if(a_img != null) img = loadImage(a_img);
    
  }
  
  public void setPosImage(int a_x, int a_y, int a_w, int a_h)
  {
    
    positionImage.setPos(a_x + position.x, a_y + position.y, a_w, a_h);
    
  }
  
  public void setPosTexte(int a_x, int a_y, int a_w, int a_h)
  {
    
    positionTexte.setPos(a_x + position.x, a_y + position.y, a_w, a_h);
    
  }
  
  public void setActualiser(String arg)
  {
    
    valeurActu = arg;
    
  }
  
  public String getActualiser(){
    
    return valeurActu;
    
  }
  
  public void setTexte(String arg)
  {
    
    texte = arg;
    
  }
  
  public void afficher()
  {
    
    rectMode(CENTER);
    fill(100);
    rect(position.x, position.y, position.w, position.h);
    fill(255);
    imageMode(CENTER);
    if(img != null){
      image(img, positionImage.x - positionImage.w/2, positionImage.y - positionImage.h/2, positionImage.w, positionImage.h);
    }
    rectMode(CENTER);
    textAlign(CENTER);
    text(texte, positionTexte.x, positionTexte.y, positionTexte.w, positionTexte.h);

  }
  
}
