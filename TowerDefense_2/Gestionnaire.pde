import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import java.io.FileReader;

class Gestionnaire
{    
  
  public boolean ajoutEnCours;
  public PImage tourImage;
  public boolean ajoutConfirme;
  public Point positionCamera;
  public Objet objetClique;
  public Carte carte;
  public Interface interfaceU;
  public String mode;
  public Infojeu infos;
  PImage back = loadImage("img/objets/herbe.png");
  
  public Gestionnaire()
  {
    
    tourImage = loadImage("img/objets/tour.png");
    ajoutEnCours = false;    
    ajoutConfirme = false;
    infos = new Infojeu();
    carte = new Carte();
    interfaceU = new Interface();
    mode = "JEU";
    interfaceU.setBoutons(mode);
    positionCamera = new Point(0, 0, 600, 600);
    
  }
  
  public void actualiser(final int mouseX, final int mouseY, boolean mousePressed, boolean mouseClicked, char key, int delta)
  {
    
    actualiserCamera(mouseX, mouseY, mousePressed, key);
    
    if(mousePressed && mouseX <= 600 && ajoutEnCours == false){
      
      infos.set("SELECTION", getObjetClique(mouseX, mouseY));
      
    } 
    
    infos.set("CAMERA", positionCamera);
    infos.set("CARTE", carte);
    infos.set("AJOUT_EN_COURS", ajoutEnCours);
    
    interfaceU.actualiser(mouseX, mouseY, mousePressed, mouseClicked, infos);
    
    ajoutEnCours = (Boolean)infos.get("AJOUT_EN_COURS");
    
  }
  
  public Objet getObjetClique(int mouseX, int mouseY)
  {
    
    int x, y;
    x = mouseX + positionCamera.x;
    y = mouseY + positionCamera.y;
    
    for(int  i = 0; i < carte.tours.size(); i++){
      if(carte.tours.get(i).hover(x, y)) return carte.tours.get(i);

    }

    for(int  i = 0; i < carte.murs.size(); i++){
      if(carte.murs.get(i).hover(x, y)) return carte.murs.get(i);
    }
    
    return null;
    
  }
  
  public void actualiserCamera(final int mouseX, final int mouseY, boolean mousePressed, char key)
  {
    
      int cX = 0, cY = 0;
            
      if(mousePressed && interfaceU.minicarte.positionnerCamera(mouseX, mouseY) != null){
        
        positionCamera.x = interfaceU.minicarte.positionnerCamera(mouseX, mouseY).x;
        positionCamera.y = interfaceU.minicarte.positionnerCamera(mouseX, mouseY).y;
        
      }
      
      if(mouseX < 20 || key == 'q'){
        cX = -10;
      }
      
      if(mouseX > 580 && mouseX < 600 || key == 'd'){
        cX = +10;
      }
      
      if(mouseY < 20 || key == 'z'){
        cY = -10; 
      }
      
      if(mouseY > 580 || key == 's'){
        cY = +10; 
      }
      
      positionCamera.x += cX;
      
      if(positionCamera.x <= 0) positionCamera.x = 0;
      if(positionCamera.x + positionCamera.w > carte.largeur) positionCamera.x = carte.largeur - positionCamera.w;
      
      positionCamera.y += cY;
      
      if(positionCamera.y <= 0) positionCamera.y = 0;
      if(positionCamera.y + positionCamera.h > carte.hauteur) positionCamera.y = carte.hauteur - positionCamera.h;

  }
  
  public void chargerCarte(String a_script)
  {
    
    ScriptEngineManager manager = new ScriptEngineManager();  
    ScriptEngine interpreteur = manager.getEngineByName("JavaScript");
    
    String script = chargerFichier(a_script);
    
    try{
      
      interpreteur.put("carte", carte);
      interpreteur.eval(script);
      carte = (Carte)interpreteur.get("carte");
      
    }
    
    catch(Exception e){
      
      e.printStackTrace();
      
    }
    
    interfaceU.actualiserMinicarte(carte, positionCamera);
   
  }

  public String chargerFichier(String a_fichier)
  {
   
   String[] lignes = loadStrings(a_fichier);
   String retour = "";
   
   if(lignes == null) return "";
   
   for(int i = 0; i < lignes.length; i++){
   
     retour += lignes[i] + "\n";
     
   }
    
   return retour;
    
  }
  
  public void afficher()
  {
    
    pushMatrix();
    translate(-positionCamera.x, -positionCamera.y);
    
    for(int i = 0; i < carte.largeur; i+= 600){
      for(int j = 0; j < carte.hauteur; j+= 600){
        image(back, i, j, 600, 600);
      }
    }

    carte.afficher();
    popMatrix();
    
    if(ajoutEnCours && mouseX < 600){
      
      tint(255, 125);
      image(tourImage, (mouseX / 60)*60, (mouseY / 60)*60, 60, 60);
      tint(255, 255);
      
    }
    
    interfaceU.afficher(infos);
    
  }
  
}
